pkgname=airctl-bin
pkgver=0.4.1
pkgrel=1
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

sha256sums=('0ba25b3dfacd2876edf791ced397177b27453d978937270f318cfdd8cad6f8ba'
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
