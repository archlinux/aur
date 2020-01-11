# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=rainlendar
pkgname=${_pkgname}-beta
pkgver=2.15.2
pkgrel=1
pkgdesc="A desktop Calendar, ToDo list and Event list"
arch=('x86_64')
url="http://www.rainlendar.net/"
license=('custom')
depends=('gtk2' 'libcanberra' 'libsm')
provides=('rainlendar2')
conflicts=('rainlendar-pro' 'rainlendar-lite')
source=("https://www.rainlendar.net/download/${_pkgname^}-Lite-${pkgver}-amd64.tar.bz2")
#source=("http://www.rainlendar.net/download/${pkgver##*.}/${_pkgname^}-${pkgver}-amd64.tar.bz2")
sha256sums=('abeded7f43c36eef99042d6b3683f63dd455e3d146d11bcdfb14489a361764a7')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/{opt,usr/bin,usr/share/licenses/${pkgname}}

  cp -R "${srcdir}"/rainlendar2 "${pkgdir}"/opt
  ln -s /opt/rainlendar2/rainlendar2 "${pkgdir}"/usr/bin/rainlendar
  ln -s /opt/rainlendar2/License.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
