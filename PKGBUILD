# Maintainer: jaboll <spexe0011@gmail.com>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=open-quickshare-bin
pkgver=0.15.2
pkgrel=1
pkgdesc="Complete Quick Share implementation for Linux with Bluetooth LE and Wi-Fi Direct"
arch=('x86_64')
url="https://github.com/ignotusbucius/open-quickshare"
license=('GPL-3.0-only')

depends=(
  'gtk3'
  'libayatana-appindicator'
  'libsoup3'
  'webkit2gtk-4.1'
  'bluez'
  'networkmanager'
)

optdepends=(
  'wpa_supplicant: Wi-Fi Direct support with a compatible NetworkManager backend'
  'bluez-utils: Bluetooth troubleshooting utilities'
)

provides=(
  'r-quick-share'
  'rquickshare'
)

conflicts=(
  'r-quick-share'
  'r-quick-share-bin'
  'rquickshare'
)

options=('!debug')

source=(
  "$url/releases/download/v$pkgver/open-quickshare_${pkgver}_x86_64.deb"
)

sha256sums=('85c0f86b1b024cabfb27c77dc7eeda2abc49542bf9cc4f58484187af4e18301b')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir/"
}
