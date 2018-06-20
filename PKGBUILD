# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=yq
pkgver=2.6.0
pkgrel=1
pkgdesc="Command-line YAML processor - jq wrapper for YAML documents"
url="https://github.com/kislyuk/yq"
depends=('python' 'python-yaml' 'jq' 'python-xmltodict>=0.11.0')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/y/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c64f763e8409ed55eb055793c26fc347b5a6666b303d49e9d2f8d7cea979df73')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
