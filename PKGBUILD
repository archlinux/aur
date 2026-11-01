# Maintainer: JAuxance <auxance.jourdan@proton.me>
pkgname=manager-bin
_pkgname=manager
pkgver=1.11.0
pkgrel=1
pkgdesc="Productivity companion — day counter, focus timer, schedule, journal"
arch=('x86_64')
url="https://github.com/JAuxance/manager-releases"
license=('custom: Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
optdepends=('gtk-layer-shell: timer widget on Wayland (Hyprland, Sway, KDE)')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Manager_${pkgver}_amd64.deb")
sha256sums=('c6a5198a85400832ea62ad0be71ebf2198bf11e6b88717622a958fac9b7c0ecf')
options=('!strip' '!debug')

prepare() {
  ar x "${pkgname}-${pkgver}.deb"
}

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
}
