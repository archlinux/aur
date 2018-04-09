# Maintainer: Samuel Tardieu <sam@rfc1149.net>

pkgname=adasockets
pkgver=1.11.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="BSD sockets in Ada"
url="http://www.rfc1149.net/devel/adasockets"
license=('custom:GNAT_Modified_GPL')
depends=('sh')
makedepends=('gcc-ada')
options=('!libtool')
source=(http://www.rfc1149.net/download/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('77b3ec77eb307d9700668d10402c3bfb4eb031c5b6f5c17d6a1bbe25e9083e56')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
  install -D -m 644 GMGPL ${pkgdir}/usr/share/licenses/$pkgname/GNAT_Modified_GPL
}

# vim:set ts=2 sw=2 et:
