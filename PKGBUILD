# Maintainer: Ivan Odnoorov <elcheshirecat at yandex dot ru>
# Fork of https://github.com/Rexilone/yamusic-cli
pkgname=ymusic-cli-bin
_pkgname=ymusic-cli
pkgver=0.9.0
pkgrel=1
pkgdesc="Terminal client for Yandex Music: My Wave, likes, stations (TUI); fork of https://github.com/Rexilone/yamusic-cli — prebuilt static binary"
arch=('x86_64' 'aarch64')
url="https://github.com/iodnoorov/ymusic"
license=('MIT')
depends=('mpv')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/ymusic-$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/ymusic-$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('2ac4003db55f04dc94ae9749b69477a4ee78b3b373bfcf3f6369d6154d4d4d22')
sha256sums_aarch64=('992953faaad01010077d077ff75c36789712959eab8851f54f376b026a94de9a')

package() {
  cd "ymusic-$pkgver-$CARCH-linux"
  install -Dm755 ymusic "$pkgdir/usr/bin/ymusic"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
