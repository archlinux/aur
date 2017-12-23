# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=rainlendar
pkgname=${_pkgname}-beta
pkgver=2.14.b153
pkgrel=1
pkgdesc="A desktop Calendar, ToDo list and Event list"
arch=('x86_64')
url="http://www.rainlendar.net/"
license=('custom')
depends=('curl' 'webkitgtk2' 'libcanberra' 'enchant1.6' 'icu59')
provides=('rainlendar2')
conflicts=('rainlendar-pro' 'rainlendar-lite')
source=("http://www.rainlendar.net/download/${pkgver##*.}/${_pkgname^}-${pkgver}-amd64.tar.bz2")
sha256sums=('c35f3df4dd30e4b599e67ca184e20fbd599e9d851b24f8b0e4a3511db446deba')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/{opt,usr/bin,usr/share/licenses/$pkgname}

  cp -R "${srcdir}"/rainlendar2 "${pkgdir}"/opt
  ln -s /opt/rainlendar2/rainlendar2 "${pkgdir}"/usr/bin/rainlendar
  ln -s /opt/rainlendar2/License.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
