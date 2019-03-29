# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=pyosmium
_module='osmium'
pkgver=2.15.2
pkgrel=1
pkgdesc="Python bindings for libosmium, the data processing library for OSM data"
url="https://osmcode.org/pyosmium"
depends=('python' 'libosmium' 'pybind11')
makedepends=('python-setuptools')
license=('BSD')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/source/o/osmium/osmium-${pkgver}.tar.gz")
sha256sums=('0d0b9baa07ba4148e686f0727997eedfa5ddb8ae67a2f4d162efcfb9e0fe3f41')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
