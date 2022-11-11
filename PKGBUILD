# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=pyosmium
_module='osmium'
pkgver=3.5.0
pkgrel=1
pkgdesc="Python bindings for libosmium, the data processing library for OSM data"
url="https://osmcode.org/pyosmium"
depends=('python' 'libosmium' 'pybind11')
makedepends=('python-setuptools' 'cmake')
license=('BSD')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/source/o/osmium/osmium-${pkgver}.tar.gz")
sha256sums=('60470b7ef1fd7bb1ffbfcf69cad3abe5ee313624401157e96ef137e41f8947a7')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
