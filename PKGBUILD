# $Id$
# Maintainer: Jon Mayo <jon.mayo at gmail dot com>
pkgname=jupp
pkgver="38"
pkgrel=1
pkgdesc="Fork of the joe text editor. Jupp is \"the Editor which sucks less\""
arch=('i686' 'x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://www.mirbsd.org/jupp.htm"
license=('GPL')
depends=('ncurses')
conflicts=('joe')
backup=('etc/joe/jmacsrc' 'etc/joe/joerc' 'etc/joe/jpicorc' 'etc/joe/jstarrc' 'etc/joe/jupprc' 'etc/joe/rjoerc')
source=("https://www.mirbsd.org/MirOS/dist/jupp/joe-3.1${pkgname}${pkgver}.tgz")
# source=("http://pub.allbsd.org/MirOS/dist/jupp/joe-3.1${pkgname}${pkgver}.tgz")
sha1sums=('8c5f423cf7b8f884756b9be4c0b48279d378d2fc')
md5sums=('df3df133eed0a28a72f7fb334a7bca4e')

build() {
  cd "${srcdir}"/${pkgname}

  bash -- ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --disable-termidx
  make
}

package() {
  cd "${srcdir}"/${pkgname}

  make DESTDIR="${pkgdir}/" install
}
