# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: ronny <ronny63@gmail.com>
# Contributor: Massimiliano Brocchini <proc80@gmail.com>

pkgname=rainlendar-pro
pkgver=2.19.0
pkgrel=1
pkgdesc="A desktop Calendar, ToDo list and Event list"
arch=('x86_64')
url="http://www.rainlendar.net/"
license=('custom')
depends=('gtk2' 'libcanberra' 'libsm')
provides=('rainlendar2')
conflicts=('rainlendar-lite')
source=("https://www.rainlendar.net/download/${pkgver}/Rainlendar-Pro-${pkgver}-amd64.tar.bz2")
sha256sums=('033f74fb42192e33832bf5ef540ca5d03bf38e4893b0bcda714d0c0e632fdf28')

package() {
  install -d "${pkgdir}"/{opt,usr/bin,usr/share/licenses/${pkgname}}

  cp -R "${srcdir}"/rainlendar2 "${pkgdir}"/opt
  ln -s /opt/rainlendar2/rainlendar2 "${pkgdir}"/usr/bin/rainlendar
  ln -s /opt/rainlendar2/License.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
