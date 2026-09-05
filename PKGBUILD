# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=python-stitching
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="A Python package for fast and robust Image Stitching"
arch=('any')
url="https://github.com/OpenStitching/stitching"
license=('Apache-2.0')
depends=('python' 'python-opencv>=4.0.1' 'python-largestinteriorrectangle' 'python-numpy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=('python-requests')
optdepends=()
provides=('stitch')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cc57b9484248806ab2bbbeaac86e33a6fb6a2d799a74b21899ab1faa51c187f0')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

# TODO: No tests passed yet
# check() {
#     cd "$_name-$pkgver"
#     python -m unittest discover -s tests
# }

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
