# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Michal Hybner <dta081@gmail.com>

pkgname=libosip2
epoch=1
pkgver=5.1.0
pkgrel=1
pkgdesc="an implementation of SIP"
arch=('x86_64' 'i686')
url="http://www.gnu.org/software/osip/"
license=('LGPL')
depends=(glibc)
options=(!emptydirs)
validpgpkeys=('34C3985D068879312FE23C8BB5902A3AD90A5421')
source=(https://ftp.gnu.org/gnu/osip/libosip2-${pkgver/_/-}.tar.gz)
sha256sums=('40573a997a656f967b2b5ebafbd36d7f1d4a4634abcf312643854057d061f145')

build() {
  cd "$srcdir"/libosip2-${pkgver/_/-}/
  ./configure --prefix=/usr --disable-semaphore --enable-sysv
  make
}

package() {
  cd "$srcdir"/libosip2-${pkgver/_/-}/
  make DESTDIR="$pkgdir" install
}
