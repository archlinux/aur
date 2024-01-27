# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=python-stitching
_name=${pkgname#python-}
pkgver=0.5.3
pkgrel=4
pkgdesc="A Python package for fast and robust Image Stitching"
arch=('any')
url="https://github.com/OpenStitching/stitching"
license=('Apache-2.0')
depends=('python' 'python-opencv>=4.0.1' 'python-largestinteriorrectangle' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel')
# checkdepends=('python-requests')
optdepends=()
provides=('stitch')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4e31a8585dd9e5b334680e133449426a6a77775a818211f8c682d8f20461b936')

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
