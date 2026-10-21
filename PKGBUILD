# Maintainer: Ivan Odnoorov <elcheshirecat at yandex dot ru>
pkgname=ymusic-cli-bin
_pkgname=ymusic-cli
pkgver=3.1.0
pkgrel=1
pkgdesc="Terminal client for Yandex Music: My Wave, likes, stations (TUI) — prebuilt static binary"
arch=('x86_64')
url="https://github.com/iodnoorov/ymusic"
license=('MIT')
optdepends=('pipewire-pulse: share the sound card with other programs (or pulseaudio; without them sound goes straight to ALSA)')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/ymusic-$pkgver-x86_64-linux.tar.gz")
sha256sums=('6b8f9545b6e0d3afd9e1b7c7c0911bc46809f8216f22a7be908994bb11b4dc42')

package() {
  cd "ymusic-$pkgver-x86_64-linux"
  install -Dm755 ymusic "$pkgdir/usr/bin/ymusic"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
