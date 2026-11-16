# Maintainer: Ivan Odnoorov <elcheshirecat at yandex dot ru>
pkgname=ymusic-cli-bin
_pkgname=ymusic-cli
pkgver=3.11.0
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
sha256sums=('e1055f6ab5444b6e85ca8c36816169109f07d074c56bfd3e2e1b7e77fc6ec39b')

package() {
  cd "ymusic-$pkgver-x86_64-linux"
  install -Dm755 ymusic "$pkgdir/usr/bin/ymusic"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSE-FDK-AAC "$pkgdir/usr/share/licenses/$pkgname/LICENSE-FDK-AAC"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
