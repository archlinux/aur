# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=gitwhodid
pkgver=0.1.1
pkgrel=1
pkgdesc="Who did that? A CLI to reveal Git history by file."
arch=("any")
url="https://github.com/stabldev/gitwhodid"
license=("MIT")
depends=(
  "python-click"
  "python-rich"
)
makedepends=(
  "python-build"
  "python-installer"
  "python-wheel"
  "python-uv-build"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52617d23f4e8f4eff562fe5513cdf00a1ecb1f043beb11ed74d2755f8f59e1af')

build() {
  cd "$srcdir/gitwhodid-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/gitwhodid-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
