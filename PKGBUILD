# Maintainer: Samuel Tardieu <sam@rfc1149.net>

pkgname=adasockets
pkgver=1.12.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="BSD sockets in Ada"
url="http://www.rfc1149.net/devel/adasockets"
license=('custom:GNAT_Modified_GPL')
depends=('sh')
makedepends=('gcc-ada')
options=('!libtool')
source=(https://rfc1149.net/download/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('11fa13ef1e37edfa0af49c9f01d70381c5593eaa47e7db2f9ba1f00dbfa439e2')

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
