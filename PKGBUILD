# Maintainer: Vladimir (wlroots)
pkgname=zapret-gui-nodejs-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="A graphical user interface (GUI) for Zapret and Telegram proxy designed to bypass DPI blocks."
arch=('x86_64')
url="https://github.com/AvenCores/zapret-gui-nodejs"
license=('GPL3')
depends=(
  'nftables'
  'iproute2'
  'procps-ng'
  'polkit'
)

options=('!strip' '!debug')
optdepends=(
  'libappindicator-gtk3: for system tray icon support'
)

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Zapret-GUI-${pkgver}.deb")
sha256sums_x86_64=('0005916a72d6d462bdbba27a73cd7d6cfb3384c7950f8e05ee35a84467d15df5')

package() {
  bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}"
  chmod -R 755 "${pkgdir}"
}
