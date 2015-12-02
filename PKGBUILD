# Maintainer: Samuel Tardieu <sam@rfc1149.net>

pkgname=adasockets
pkgver=1.10
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="BSD sockets in Ada"
url="http://www.rfc1149.net/devel/adasockets"
license=('custom:GNAT_Modified_GPL')
depends=('sh')
makedepends=('gcc-ada' 'autogen')
options=('!libtool')
install=adasockets.install
source=(http://www.rfc1149.net/download/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('b1250e9d449db0a4e8547ac96b9724bd')

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
