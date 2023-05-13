# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-gnutls
pkgver=3.7.12
pkgrel=1
pkgdesc='Guile bindings for the GnuTLS library'
arch=('x86_64' 'i686' 'armv7h')
url='https://gitlab.com/gnutls/guile'
license=('LGPL')
depends=('guile' 'gnutls')
source=(
  "https://ftp.gnu.org/gnu/gnutls/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=(
  '5d3af11573093de59f258415872e2c5b14cca9dd251a8b2ec1643d6e97fee336'
  '3aa3bcdf69ff21d6f5e0ac9cfd820431edd04f0cb3d0f1a4db72bb33122a7e88')
validpgpkeys=('B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --disable-srp-authentication
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
