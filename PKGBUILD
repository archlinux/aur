# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=pyosmium
_module='osmium'
pkgver=3.3.0
pkgrel=1
pkgdesc="Python bindings for libosmium, the data processing library for OSM data"
url="https://osmcode.org/pyosmium"
depends=('python' 'libosmium' 'pybind11')
makedepends=('python-setuptools' 'cmake')
license=('BSD')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/source/o/osmium/osmium-${pkgver}.tar.gz")
sha256sums=('e2d7a5e187436d22efe77539becb8f8a7ea7a874f0dae51c2bde0990ef3426ea')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
