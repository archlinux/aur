# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-pypcd
pkgver=0.1.1
pkgrel=1
pkgdesc="Pure Python module to read and write point clouds stored in the PCD file format"
url="https://github.com/dimatura/pypcd"
depends=(python)
makedepends=(python-setuptools)
license=("BSD")
arch=(any)
source=("https://files.pythonhosted.org/packages/99/c5/f0b3003d36f50bb084c887e5277ceff0c7671f92690c8a69910b21a2519f/pypcd-0.1.1.tar.gz")
sha256sums=('32a14d37ffbfd4efe7a10191f26581c48986208ac9a1fdd02f25a6dfa9b144c2')


prepare() {
    cd "pypcd-${pkgver}"
    touch HISTORY.rst
}

build() {
    cd "pypcd-${pkgver}"
    python setup.py build
}

package() {
    cd "pypcd-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
