pkgname=airctl-bin
pkgver=0.2.2
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

sha256sums=('390a3f2a2360235b832ba9f85990fcab3fa4ade70333c6fcc7feb8ed0869f79c'
            '6793e486bfb640f93e7456364172355bdee80b759502d638ecf7cc3fdc078a5b'
            'd05d396e1e0550f7cd523be523728f1a48ed66db18f9488ddc4ec59dff0ee273')

package() {
  install -Dm755 "$srcdir/airctl" \
    "$pkgdir/usr/bin/airctl"

  install -Dm644 "$srcdir/airctl.desktop" \
    "$pkgdir/usr/share/applications/airctl.desktop"

  install -Dm644 "$srcdir/airctl.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/airctl.png"
}
