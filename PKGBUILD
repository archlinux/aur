# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: ronny <ronny63@gmail.com>
# Contributor: Massimiliano Brocchini <proc80@gmail.com>

pkgname=rainlendar-lite
pkgver=2.13.1
pkgrel=2
pkgdesc="A desktop Calendar, ToDo list and Event list"
arch=('i686' 'x86_64')
url="http://www.rainlendar.net/"
license=('custom')
depends=('curl' 'gtk2' 'glibc' 'expat' 'libsm' 'libstdc++5' 'libpng12'
         'libjpeg6-turbo' 'sdl' 'rtmpdump' 'libidn' 'webkitgtk2')
provides=('rainlendar2')
conflicts=('rainlendar-pro')
source_x86_64=(http://www.rainlendar.net/download/Rainlendar-Lite-$pkgver-amd64.tar.bz2)
source_i686=(http://www.rainlendar.net/download/Rainlendar-Lite-$pkgver-i386.tar.bz2)
md5sums_i686=('6e0db4ae76515e194667756ddd07e25a')
md5sums_x86_64=('b004ec559af1ec7b03d6519012162a86')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/{opt,usr/bin,usr/share/licenses/$pkgname}

  cp -R "${srcdir}"/rainlendar2 "${pkgdir}"/opt
  ln -s /opt/rainlendar2/rainlendar2 "${pkgdir}"/usr/bin/rainlendar
  ln -s /opt/rainlendar2/License.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
