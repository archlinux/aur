# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=pyosmium
_module='osmium'
pkgver=2.14.3
pkgrel=1
pkgdesc="Python bindings for libosmium, the data processing library for OSM data"
url="https://osmcode.org/pyosmium"
depends=('python' 'libosmium')
makedepends=('python-setuptools')
license=('BSD')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/source/o/osmium/osmium-${pkgver}.tar.gz")
md5sums=('e768403c256a06c6d6457707550835d0')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
