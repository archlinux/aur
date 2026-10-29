# Maintainer: Ivan Odnoorov <elcheshirecat at yandex dot ru>
pkgname=ymusic-cli-bin
_pkgname=ymusic-cli
pkgver=3.6.3
pkgrel=1
pkgdesc="Terminal client for Yandex Music: My Wave, likes, stations (TUI) — prebuilt static binary"
arch=('x86_64')
url="https://github.com/iodnoorov/ymusic"
license=('MIT' 'FDK-AAC')
optdepends=('pipewire-pulse: share the sound card with other programs (without a sound server sound goes straight to ALSA)'
            'pulseaudio: the same with PulseAudio instead of PipeWire')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/ymusic-$pkgver-x86_64-linux.tar.gz")
sha256sums=('88a4be097533c8562a571e39fcc35adc34beab012407869372edba2810ebe229')

package() {
  cd "ymusic-$pkgver-x86_64-linux"
  install -Dm755 ymusic "$pkgdir/usr/bin/ymusic"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSE-FDK-AAC "$pkgdir/usr/share/licenses/$pkgname/LICENSE-FDK-AAC"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
