# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: ronny <ronny63@gmail.com>
# Contributor: Massimiliano Brocchini <proc80@gmail.com>

pkgname=rainlendar-lite
pkgver=2.12.2
pkgrel=1
pkgdesc="A desktop Calendar, ToDo list and Event list"
arch=('i686' 'x86_64')
url="http://www.rainlendar.net/"
license=('custom')
depends=('curl' 'gtk2' 'glibc' 'expat' 'libsm' 'libstdc++5' 'libpng12' 'libjpeg6' 'sdl' 'rtmpdump' 'libidn')
provides=('rainlendar2')
conflicts=('rainlendar-pro')

if [ "${CARCH}" = 'x86_64' ]; then
    source=(http://www.rainlendar.net/download/Rainlendar-Lite-$pkgver-amd64.tar.bz2)
    md5sums=('29323e413c414d10f73d5445aa7cd767')
  else
    source=(http://www.rainlendar.net/download/Rainlendar-Lite-$pkgver-i386.tar.bz2)
    md5sums=('6c6e645f4ec0b9e35f0c2463deb76d65')
fi

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/opt ${pkgdir}/usr/bin \
    "${pkgdir}"/usr/share/licenses/$pkgname ${pkgdir}/usr/lib

  cp -R "${srcdir}"/rainlendar2 "${pkgdir}"/opt
  ln -s /opt/rainlendar2/rainlendar2 "${pkgdir}"/usr/bin/rainlendar
  ln -s /opt/rainlendar2/License.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
