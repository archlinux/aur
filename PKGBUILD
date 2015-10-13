# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: ronny <ronny63@gmail.com>
# Contributor: Massimiliano Brocchini <proc80@gmail.com>

pkgname=rainlendar-lite
pkgver=2.13
pkgrel=1
pkgdesc="A desktop Calendar, ToDo list and Event list"
arch=('i686' 'x86_64')
url="http://www.rainlendar.net/"
license=('custom')
depends=('curl' 'gtk2' 'glibc' 'expat' 'libsm' 'libstdc++5' 'libpng12' 'libjpeg6-turbo' 'sdl' 'rtmpdump' 'libidn')
provides=('rainlendar2')
conflicts=('rainlendar-pro')
source_x86_64=http://www.rainlendar.net/download/Rainlendar-Lite-$pkgver-amd64.tar.bz2
source_i686=http://www.rainlendar.net/download/Rainlendar-Lite-$pkgver-i386.tar.bz2
md5sums_i686=('c6185666358a1ef491a7ea22cef6b3d3')
md5sums_x86_64=('14cf1ab85c6f60b719a6df92af0e5f66')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/{opt,usr/bin,usr/share/licenses/$pkgname}

  cp -R "${srcdir}"/rainlendar2 "${pkgdir}"/opt
  ln -s /opt/rainlendar2/rainlendar2 "${pkgdir}"/usr/bin/rainlendar
  ln -s /opt/rainlendar2/License.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
