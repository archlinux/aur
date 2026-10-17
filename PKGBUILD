# Maintainer: Ivan Odnoorov <elcheshirecat at yandex dot ru>
pkgname=ymusic-cli-bin
_pkgname=ymusic-cli
pkgver=1.1.0
pkgrel=1
pkgdesc="Terminal client for Yandex Music: My Wave, likes, stations (TUI) — prebuilt static binary"
arch=('x86_64')
url="https://github.com/iodnoorov/ymusic"
license=('MIT')
depends=('mpv')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/ymusic-$pkgver-x86_64-linux.tar.gz")
sha256sums=('c88def9ef2d0652e359e87bf85660980a36e924fc45b8d2cc53ec199da2dab94')

package() {
  cd "ymusic-$pkgver-x86_64-linux"
  install -Dm755 ymusic "$pkgdir/usr/bin/ymusic"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
