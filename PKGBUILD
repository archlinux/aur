# Maintainer: jaboll <spexe0011@gmail.com>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=open-quickshare-bin
_pkgname="${pkgname%-bin}"
pkgver=0.16.1
pkgrel=1
pkgdesc="Complete Quick Share implementation for Linux with Bluetooth LE and Wi-Fi Direct"
arch=('x86_64')
url="https://github.com/ignotusbucius/${_pkgname}"
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
  "$_pkgname"
  'r-quick-share'
  'rquickshare'
)

conflicts=(
  "$_pkgname"
  'r-quick-share'
  'rquickshare'
)

options=('!debug')

source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_x86_64.deb")

sha256sums=('4a4df6ab643fc5744b5f854d235b0f8f613e2371f5729ffeda50701a287d84a6')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir/"
}
