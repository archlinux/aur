# Maintainer: JAuxance <auxance.jourdan@proton.me>
pkgname=manager-bin
_pkgname=manager
pkgver=1.7.2
pkgrel=1
pkgdesc="Productivity companion — day counter, focus timer, schedule, journal"
arch=('x86_64')
url="https://github.com/JAuxance/manager-releases"
license=('custom: Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Manager_${pkgver}_amd64.deb")
sha256sums=('11fd5403ff308137f8ed0bbcd42a1146a501dc661c2be72a3851e62b2ca0d8b6')
options=('!strip' '!debug')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
}

prepare() {
  ar x "${pkgname}-${pkgver}.deb"
}
