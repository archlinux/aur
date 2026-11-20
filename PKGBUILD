# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=yt-tui
pkgver=1.2.0
pkgrel=1
pkgdesc="Curses TUI for yt-dlp with search and queueing"
arch=('any')
url="https://github.com/Twilight0/yt-tui"
license=('MIT')
depends=('python' 'yt-dlp' 'ffmpeg')
makedepends=('python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Twilight0/yt-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bd11792958d61e13e66f91fc01a5d186e77127cd248255fc01b6accaa227fee9')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
