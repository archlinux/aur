# Maintainer: Samuel Tardieu <sam@rfc1149.net>

pkgname=adasockets
pkgver=1.14
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="BSD sockets in Ada"
url="https://rfc1149.net/devel/adasockets"
license=('custom:GNAT_Modified_GPL')
depends=('sh')
makedepends=('gcc-ada')
options=('!libtool')
source=(https://rfc1149.net/download/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('84dc04e5f61ca158f629edb1aeda7783d8ca8f458d4a5daae2d2daf6628087c6')
sha512sums=('f0cfe699792c6cc54c18f925ba5941435e37dbf23c4629b0cb90b5f7d699e2d95fea4a28b703d1e7c88af36e42214a53c415d0d840f8be3bd60f57bab592e663')

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
