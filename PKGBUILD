# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=yq
pkgver='2.0.2'
pkgrel=1
pkgdesc="Command-line YAML processor - jq wrapper for YAML documents"
url="https://github.com/kislyuk/yq"
depends=('python')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/y/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6582c1f33ea4b6cc5a42742ac7c41a63114fba69b95d1b1f2648f13fbb51aa24')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
