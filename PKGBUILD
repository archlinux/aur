# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=libgadu
pkgver=1.11.4
pkgrel=1
pkgdesc="This library implements the client side of the Gadu-Gadu protocol"
arch=('i686' 'x86_64')
url="http://libgadu.net/"
license=('LGPL2.1')
depends=('openssl' 'zlib')
source=("http://github.com/wojtekka/libgadu/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('feef622126e21601798c7e4497890ca3')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --disable-static \
    --enable-shared \
    --with-pthread
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
