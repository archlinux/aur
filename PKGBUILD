# Maintainer: Winux <winux@winux.it>
pkgname=python-ffmpy
_pkgname=ffmpy
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple Python wrapper for ffmpeg"
arch=(any)
url="https://github.com/Ch00k/ffmpy"
license=(MIT)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
depends=('python' 'ffmpeg')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('11d04a042c69bcd80cc343a835f670fa485421fc46a719c86d5229cac693a0a8')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
