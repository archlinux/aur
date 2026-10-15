# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=yt-tui
pkgver=1.1.0
pkgrel=1
pkgdesc="Curses TUI for yt-dlp with search and queueing"
arch=('any')
url="https://github.com/Twilight0/yt-tui"
license=('MIT')
depends=('python' 'yt-dlp' 'ffmpeg')
makedepends=('python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Twilight0/yt-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ce70a68e4648962ed0471660ba6da9be71d21368a75eb69e821a8bf05c0444ac')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
