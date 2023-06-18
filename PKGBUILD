# Maintainer: Samuel Tardieu <sam@rfc1149.net>

pkgname=adasockets
pkgver=1.13
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="BSD sockets in Ada"
url="http://www.rfc1149.net/devel/adasockets"
license=('custom:GNAT_Modified_GPL')
depends=('sh')
makedepends=('gcc-ada')
options=('!libtool')
source=(https://rfc1149.net/download/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('a0b34c5595d42f78ff2aed177f90f47b5a55f321d4e56b3f031a9d1cb7e8920a')
sha512sums=('ff7fbacbad7c946ad15258bf1965df14d74224ab3c0c7b87e68ff99dd82f03bf8760fc70f6b53b1eea67b4332bfca62071a0704b2cf4e1f457cf486f09b56ce0')

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
