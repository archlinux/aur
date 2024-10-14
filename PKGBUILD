# Maintainer: Edmund Lodewijks <e.lodewijks at gmail.com>

pkgname=python-miltertest
_name=miltertest
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python milter protocol, mainly to act as an MTA to test milter implementations"
arch=(x86_64)
url="https://github.com/flowerysong/miltertest"
license=('GPL-3.0-only')
depends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fba38009d2966e64abd6092d1e665b3251743c5332508a9c8845b4922016b1cb')

build() {
    cd $srcdir/$_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/$_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
