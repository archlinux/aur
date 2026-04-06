# Maintainer: meledo <meledo@duck.com>
pkgname=patchwire-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="PipeWire audio output router with GTK4 UI"
arch=('x86_64')
url="https://github.com/mel-edo/patchwire"
license=('GPL-3.0-or-later')
depends=(
  'pipewire'
  'pipewire-audio'
  'wireplumber'
  'gtk4'
  'libadwaita'
)
provides=('patchwire')
conflicts=('patchwire')
source=("patchwire-bin-v$pkgver-x86_64-linux.tar.gz::https://github.com/mel-edo/patchwire/releases/download/v$pkgver/patchwire-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('b975455564f70b9575710528c0db5898d071946a21c651b137e84c7f238a5ca0')

package() {
  cd "$srcdir"

  install -Dm755 patchwire        "$pkgdir/usr/bin/patchwire"
  install -Dm755 patchwire-gtk    "$pkgdir/usr/bin/patchwire-gtk"
  install -Dm644 patchwire.service "$pkgdir/usr/lib/systemd/user/patchwire.service"
  install -Dm644 patchwire.desktop "$pkgdir/usr/share/applications/patchwire.desktop"
  install -Dm644 LICENSE           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}