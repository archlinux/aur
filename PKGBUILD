# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=rainlendar
pkgname=${_pkgname}-beta
pkgver=2.14.b152
pkgrel=1
pkgdesc="A desktop Calendar, ToDo list and Event list"
arch=('x86_64')
url="http://www.rainlendar.net/"
license=('custom')
depends=('curl' 'webkitgtk2' 'icu55' 'libcanberra' 'enchant1.6' 'icu55' 'icu59') #'sdl' 'rtmpdump' 'libidn'
provides=('rainlendar2')
conflicts=('rainlendar-pro' 'rainlendar-lite')
source=("http://www.rainlendar.net/download/${pkgver##*.}/${_pkgname^}-${pkgver}-amd64.tar.bz2")
sha256sums=('378beecb3af841b4f203203299793a3c1e2c46ee0c48fc47178bffbcaa2fa1fe')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/{opt,usr/bin,usr/share/licenses/$pkgname}

  cp -R "${srcdir}"/rainlendar2 "${pkgdir}"/opt
  ln -s /opt/rainlendar2/rainlendar2 "${pkgdir}"/usr/bin/rainlendar
  ln -s /opt/rainlendar2/License.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
