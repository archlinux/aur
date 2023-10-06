# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=python-stitching
_name=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc="A Python package for fast and robust Image Stitching"
arch=('any')
url="https://github.com/OpenStitching/stitching"
license=('Apache')
depends=('python' 'python-opencv>=4.0.1' 'python-largestinteriorrectangle' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel')
# checkdepends=('python-requests')
optdepends=()
provides=('stitch')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6f378a4cb9d5f7fc2388339e4a4969fbad8aaa879766512d0f5b82b3f6c84914')

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
