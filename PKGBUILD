# $Id$
# Maintainer: Jon Mayo <jon.mayo at gmail dot com>
pkgname=jupp
pkgver="31"
pkgrel=1
pkgdesc="Fork of the joe text editor. Jupp is \"the Editor which sucks less\""
arch=('i686' 'x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://www.mirbsd.org/jupp.htm"
license=('GPL')
depends=('ncurses')
conflicts=('joe')
optdepends=('gpm: console mouse support')
backup=('etc/joe/jmacsrc' 'etc/joe/joerc' 'etc/joe/jpicorc' 'etc/joe/jstarrc' 'etc/joe/jupprc' 'etc/joe/rjoerc')
source=("http://pub.allbsd.org/MirOS/dist/jupp/joe-3.1${pkgname}${pkgver}.tgz")
sha1sums=('2a9c5d4ab0c27cf3074c469e88936be2f1d27053')

build() {
  cd "${srcdir}"/${pkgname}

  bash -- ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}"/${pkgname}

  make DESTDIR="${pkgdir}/" install
}
