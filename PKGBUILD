# Maintainer: piernov <piernov@piernov.org>

pkgname=python-sahi
pkgver=0.11.30
pkgrel=1
pkgdesc="Lightweight vision library for performing large scale object detection/ instance segmentation"
arch=('any')
url="https://github.com/obss/sahi"
license=('MIT')
depends=('python-opencv' 'python-pillow' 'python-tqdm' 'python-shapely' 'python-pyyaml' 'python-fire' 'python-terminaltables' 'python-requests' 'python-click')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
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
