# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Giuseppe Grilli <giugrilli at gmail.com>
# Contributor: Lasagna Davide <lasagnadavide at gmail.com> 
# Contributor: Artem Stepanov <timofei1394@itsecure.in>

pkgname=minitube
pkgver=0.9
pkgrel=2
pkgdesc="A native YouTube client in QT. Watch YouTube videos without Flash Player"
arch=('i686' 'x86_64')
url="http://flavio.tordini.org/minitube"
license=('GPL')
depends=('phonon-xine' 'gstreamer0.10-good-plugins')
optdepends=('gstreamer0.10-plugins: to get all videos to play')
install=minitube.install
source=(http://flavio.tordini.org/files/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('525b4f75fa883633124183ae9015b6ed')

build() {
  cd "${srcdir}/${pkgname}"

  qmake PREFIX="/usr" || return 1
  make install INSTALL_ROOT="${pkgdir}" || return 1
} 
