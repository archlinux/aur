# Maintainer: Gareth Hubball <ridecar2@gmail.com>
pkgname=broadcast-gui-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="GTK4 GUI for AI-powered per-application noise suppression on PipeWire (pre-built binary)"
arch=('x86_64')
url="https://github.com/londospark/broadcast"
license=('GPL-3.0-or-later')
depends=('pipewire' 'pipewire-pulse' 'gtk4' 'libadwaita' 'gtk4-layer-shell')
provides=('broadcast-gui')
conflicts=('broadcast-gui' 'broadcast-gui-git')
source=("https://github.com/londospark/broadcast/releases/download/v${pkgver}/broadcast-gui"
        "https://raw.githubusercontent.com/londospark/broadcast/v${pkgver}/broadcast-gui.desktop"
        "https://raw.githubusercontent.com/londospark/broadcast/v${pkgver}/LICENSE")
sha256sums=('3babcd94d51eb568cf0e6f9a0e668fad5b8d24af93bf4fcb1a7a8b956f162d1c'
            '7a6ffbf0826c1d618f86c3da987c828c8f7be47f96eab5d4f8aa29990b29ca97'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm755 "$srcdir/broadcast-gui" "$pkgdir/usr/bin/broadcast-gui"
  install -Dm644 "$srcdir/broadcast-gui.desktop" "$pkgdir/usr/share/applications/broadcast-gui.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
