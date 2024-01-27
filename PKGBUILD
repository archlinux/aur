# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=python-largestinteriorrectangle
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=3
pkgdesc="Largest Interior/Inscribed Rectangle implementation in Python"
arch=('any')
url="https://github.com/OpenStitching/lir"
license=('Apache-2.0')
depends=('python-opencv' 'python-numba' 'python-numpy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ed8902d591c3d73c5533a9c5af2840b58fd04626be0e223f215041b2d82b8e4b')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
