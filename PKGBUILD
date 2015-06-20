# $Id$
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=make-3.81
pkgver=3.81
pkgrel=1
pkgdesc="GNU make utility to maintain groups of programs (3.81 version)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/make"
license=('GPL')
depends=('glibc' 'sh')
install=$pkgname.install
source=(ftp://ftp.gnu.org/gnu/make/${pkgname}.tar.gz)
md5sums=('a4e9494ac6dc3f6b0c5ff75c5d52abba')

build() {
  cd ${srcdir}/${pkgname}
  ./configure --prefix=/usr --program-suffix=-$pkgver
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=${pkgdir} install-exec
}
