# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=libgadu
pkgver=1.12.0
pkgrel=1
pkgdesc="This library implements the client side of the Gadu-Gadu protocol"
arch=('i686' 'x86_64')
url="http://libgadu.net/"
license=('LGPL2.1')
depends=('gnutls' 'protobuf-c')
source=("http://github.com/wojtekka/libgadu/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('e4569a0ed26136c4634fa8c4013910e3')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --disable-tests \
    --disable-static
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
