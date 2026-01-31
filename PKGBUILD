pkgname=airctl-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="WiFi network manager GUI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/pshycodr/airctl"
license=('GPL-3.0-only')

conflicts=('airctl')
provides=('airctl')

options=('!strip')

depends=(
  gtk4
  networkmanager
)


source=(
  "airctl-$pkgver.bin::https://github.com/pshycodr/airctl/releases/download/v$pkgver/main.bin"
  "airctl.desktop"
  "airctl.png"
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "$srcdir/airctl-$pkgver.bin" \
    "$pkgdir/usr/bin/airctl"

  install -Dm644 "$srcdir/airctl.desktop" \
    "$pkgdir/usr/share/applications/airctl.desktop"

  install -Dm644 "$srcdir/airctl.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/airctl.png"
}
