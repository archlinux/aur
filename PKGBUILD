# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=python-stitching
_name=${pkgname#python-}
pkgver=0.5.3
pkgrel=3
pkgdesc="A Python package for fast and robust Image Stitching"
arch=('any')
url="https://github.com/OpenStitching/stitching"
license=('Apache-2.0')
depends=('python' 'python-opencv>=4.0.1' 'python-largestinteriorrectangle' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
# checkdepends=('python-requests')
optdepends=()
provides=('stitch')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6ea39b1c6886c7e581e6fefafcd2a9b7828bd8c45667ee7d0afbac4b5566a7a9')

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
