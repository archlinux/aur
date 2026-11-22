# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=yt-tui
pkgver=1.2.1
pkgrel=1
pkgdesc="Curses TUI for yt-dlp with search and queueing"
arch=('any')
url="https://github.com/Twilight0/yt-tui"
license=('MIT')
depends=('python' 'yt-dlp' 'ffmpeg')
makedepends=('python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Twilight0/yt-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('01a738a9de034ee24325fa35c2ee68703021aa80f8608ad0d6dbba02d872af40')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
