# Maintainer: Ivan Odnoorov <elcheshirecat at yandex dot ru>
# Fork of https://github.com/Rexilone/yamusic-cli
pkgname=ymusic-cli-bin
_pkgname=ymusic-cli
pkgver=0.9.0
pkgrel=2
pkgdesc="Terminal client for Yandex Music: My Wave, likes, stations (TUI); fork of https://github.com/Rexilone/yamusic-cli — prebuilt static binary"
arch=('x86_64')
url="https://github.com/iodnoorov/ymusic"
license=('MIT')
depends=('mpv')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/ymusic-$pkgver-x86_64-linux.tar.gz")
sha256sums=('2ac4003db55f04dc94ae9749b69477a4ee78b3b373bfcf3f6369d6154d4d4d22')

package() {
  cd "ymusic-$pkgver-x86_64-linux"
  install -Dm755 ymusic "$pkgdir/usr/bin/ymusic"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
