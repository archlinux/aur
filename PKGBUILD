# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: ronny <ronny63@gmail.com>
# Contributor: Massimiliano Brocchini <proc80@gmail.com>

pkgname=rainlendar-lite
pkgver=2.14.1
pkgrel=1
pkgdesc="A desktop Calendar, ToDo list and Event list"
arch=('x86_64')
url="http://www.rainlendar.net/"
license=('custom')
depends=('curl' 'gtk2' 'glibc' 'expat' 'libsm' 'libstdc++5' 'libpng12'
         'libjpeg6-turbo' 'sdl' 'rtmpdump' 'libidn' 'webkitgtk2')
provides=('rainlendar2')
conflicts=('rainlendar-pro')
source=(http://www.rainlendar.net/download/Rainlendar-Lite-$pkgver-amd64.tar.bz2)
sha256sums=('ceba6bc4727974721e25d75c019a7ca0290da11e167ff6d6925e44ca772cfe16')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/{opt,usr/bin,usr/share/licenses/$pkgname}

  cp -R "${srcdir}"/rainlendar2 "${pkgdir}"/opt
  ln -s /opt/rainlendar2/rainlendar2 "${pkgdir}"/usr/bin/rainlendar
  ln -s /opt/rainlendar2/License.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
