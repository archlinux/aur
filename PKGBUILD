# Maintainer: M0Rf30

pkgname=netsukuku
pkgver=1.0.1
pkgrel=1
pkgdesc="an experimental peer-to-peer routing system"
arch=('i686' 'x86_64')
url="http://netsukuku.freaknet.org"
license=('GPL')
depends=(libgee vala tasklet zcd netsukuku-rpc andns-rpc ntkresolv)

source=(http://mirror.lihnidos.org/GNU/savannah//netsukuku/${pkgname}-${pkgver}.tar.gz)

build() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure --enable-logtasklet --sysconfdir=/etc --prefix=/usr
  make
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir install
}
 

md5sums=('c5c77172d3eefed9c9e0c5edad86501e')
