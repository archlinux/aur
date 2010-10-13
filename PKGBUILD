# $Id: PKGBUILD 82 2009-07-17 19:56:55Z aaron $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=libgadu
pkgver=1.9.1
pkgrel=1
pkgdesc="This library implements the client side of the Gadu-Gadu protocol"
arch=('i686' 'x86_64')
url="http://toxygen.net/libgadu/"
license=('GPL')
depends=('openssl')
options=('!libtool')
source=("http://toxygen.net/${pkgname}/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('8d68489f3c01daba95fd1f20661437fb')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
 	 --disable-static \
	 --enable-shared \
	 --with-pthread
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
