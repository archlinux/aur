# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: ronny <ronny63@gmail.com>
# Contributor: Massimiliano Brocchini <proc80@gmail.com>

pkgname=rainlendar-lite
pkgver=2.14.2
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
sha256sums=('4a63fd3183da3f1463363b3bcca14a6531a5bf5a25d22491769d7e85b4133c13')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/{opt,usr/bin,usr/share/licenses/$pkgname}

  cp -R "${srcdir}"/rainlendar2 "${pkgdir}"/opt
  ln -s /opt/rainlendar2/rainlendar2 "${pkgdir}"/usr/bin/rainlendar
  ln -s /opt/rainlendar2/License.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
