# Maintainer: JAuxance <auxance.jourdan@proton.me>
pkgname=manager-bin
_pkgname=manager
pkgver=1.8.3
pkgrel=1
pkgdesc="Productivity companion — day counter, focus timer, schedule, journal"
arch=('x86_64')
url="https://github.com/JAuxance/manager-releases"
license=('custom: Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Manager_${pkgver}_amd64.deb")
sha256sums=('645318ceba83076b6bc65ae0529565cfd386dc57fb0b1aafbbceda3807a0df26')
options=('!strip' '!debug')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
}

prepare() {
  ar x "${pkgname}-${pkgver}.deb"
}
