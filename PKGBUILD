# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=libgadu
pkgver=1.10.1
pkgrel=1
pkgdesc="This library implements the client side of the Gadu-Gadu protocol"
arch=('i686' 'x86_64')
url="http://toxygen.net/libgadu/"
license=('GPL')
depends=('openssl')
options=('!libtool')
source=("http://toxygen.net/${pkgname}/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('4dd528bc0627e4bd59f79b07f0e8cdbc')

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
