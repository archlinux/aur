# Maintainer: piernov <piernov@piernov.org>

pkgname=python-sahi
pkgver=0.14.0
pkgrel=1
pkgdesc="Lightweight vision library for performing large scale object detection/ instance segmentation"
arch=('any')
url="https://github.com/obss/sahi"
license=('MIT')
depends=(
  'python-opencv'
  'python-matplotlib'
  'python-shapely'
  'python-tqdm'
  'python-pillow'
  'python-numpy'
  'python-pyyaml'
  'python-fire'
  'python-requests'
  'python-click'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/obss/sahi#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/sahi
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/sahi
  python -m installer --destdir="$pkgdir" dist/*.whl
}
