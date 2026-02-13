pkgname=airctl-bin
pkgver=0.3.0
pkgrel=4
pkgdesc="WiFi network manager GUI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/pshycodr/airctl"
license=('GPL-3.0-only')

conflicts=('airctl')
provides=('airctl')

options=('!strip' '!debug')

depends=(
  gtk4
  networkmanager
)

source=(
  "airctl::https://github.com/pshycodr/airctl/releases/download/v$pkgver/airctl.bin"
  "airctl.desktop"
  "airctl.png"
)

sha256sums=('351d2107a8b5f9a3703510278b6fa5e6450aeeb6a91cf01f9494ca79e08fdfc0'
            '6793e486bfb640f93e7456364172355bdee80b759502d638ecf7cc3fdc078a5b'
            '52a7739d4c5df047278af3d363ce6b0c6463d2afa151eeb0efda392b683dcb29')

package() {
  install -Dm755 "$srcdir/airctl" \
    "$pkgdir/usr/bin/airctl"

  install -Dm644 "$srcdir/airctl.desktop" \
    "$pkgdir/usr/share/applications/airctl.desktop"

  install -Dm644 "$srcdir/airctl.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/airctl.png"
}
