# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-gnutls
pkgver=3.7.11
pkgrel=1
pkgdesc='Guile bindings for the GnuTLS library'
arch=('x86_64' 'i686' 'armv7h')
url='https://gitlab.com/gnutls/guile'
license=('LGPL')
depends=('guile' 'gnutls')
source=(
  "https://ftp.gnu.org/gnu/gnutls/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=(
  '058eaa5c763e19fbf93e8b4eefc11280f8070535c138c99be11f00cd685613df'
  '4f4ed40bff804dbdda4a98ef7590f197d327c7b5e9da15860d21b5ec5e947379')
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
