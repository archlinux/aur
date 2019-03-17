# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=rainlendar
pkgname=${_pkgname}-beta
pkgver=2.14.3.b159
pkgrel=1
pkgdesc="A desktop Calendar, ToDo list and Event list"
arch=('x86_64')
url="http://www.rainlendar.net/"
license=('custom')
depends=('gtk2' 'libcanberra' 'libsm')
provides=('rainlendar2')
conflicts=('rainlendar-pro' 'rainlendar-lite')
source=("http://www.rainlendar.net/download/${pkgver##*.}/${_pkgname^}-${pkgver}-amd64.tar.bz2")
sha256sums=('a21dc758c5640ce4b7c308d9765468a72435bec00542685957607b5aa8551c6f')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/{opt,usr/bin,usr/share/licenses/${pkgname}}

  cp -R "${srcdir}"/rainlendar2 "${pkgdir}"/opt
  ln -s /opt/rainlendar2/rainlendar2 "${pkgdir}"/usr/bin/rainlendar
  ln -s /opt/rainlendar2/License.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
