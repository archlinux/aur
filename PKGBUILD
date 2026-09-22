# Maintainer: Vladimir (wlroots)
pkgname=zapret-gui-nodejs-bin
pkgver=1.0.8
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
sha256sums_x86_64=('60c7d5105f19b06e6ef43b777bd81b34de0749ba7501bc1073d3ecfc0808a91d')

package() {
  bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}"
  chmod -R 755 "${pkgdir}"
}
