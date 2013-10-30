# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=libgadu
pkgver=1.11.2
pkgrel=1
pkgdesc="This library implements the client side of the Gadu-Gadu protocol"
arch=('i686' 'x86_64')
url="http://toxygen.net/libgadu/"
license=('LGPL2.1')
depends=('openssl')
source=("http://toxygen.net/${pkgname}/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('832432fef251f69f31e68574c17f0c51')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
 	 --disable-static \
	 --enable-shared \
	 --with-pthread
  make
}

check() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make check
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
