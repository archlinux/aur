# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=pyosmium
_module='osmium'
pkgver=3.1.2
pkgrel=1
pkgdesc="Python bindings for libosmium, the data processing library for OSM data"
url="https://osmcode.org/pyosmium"
depends=('python' 'libosmium' 'pybind11')
makedepends=('python-setuptools' 'cmake')
license=('BSD')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/source/o/osmium/osmium-${pkgver}.tar.gz")
sha256sums=('2add625aa9db1910cce9d0670cbe89192278682cc9a9ccd3a88ceca9005398cd')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
