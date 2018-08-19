# Maintainer: Niklas <dev@n1klas.net>

pkgname=python-pyhomematic
_name=pyhomematic
pkgver=0.1.46
pkgrel=1
pkgdesc="Python 3 Interface to interact with Homematic devices"
arch=('any')
url="https://github.com/danielperna84/pyhomematic"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/danielperna84/pyhomematic/archive/${pkgver}.tar.gz")
sha512sums=('3fe6cea451fdd2897ee04b8d27028279e45438da69b55acd8d22fb12d6bde171ed23910960c09b56c75ae34e6e6b311e7b33ccaf49878c634b308a04c13b59f6')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
