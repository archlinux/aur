# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=yq
pkgver=2.3.4
pkgrel=1
pkgdesc="Command-line YAML processor - jq wrapper for YAML documents"
url="https://github.com/kislyuk/yq"
depends=('python' 'python-yaml' 'jq')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/y/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e8a83765b8ac22479f83db80d161f1d9834c6e6bd07916a339a1221b2bcd9311')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
