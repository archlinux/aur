# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Roman Lapin <lampus.lapin@gmail>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gdsl
pkgver=1.8
pkgrel=1
pkgdesc="A collection of routines for generic data structures manipulation"
arch=('i686' 'x86_64')
url="http://home.gna.org/gdsl/"
license=('GPL')
depends=('bash')
options=('!libtool')
source=("http://download.gna.org/gdsl/$pkgname-${pkgver}.tar.gz")
md5sums=('9130067fbabdd1d73c92de9be73c62e8')
sha1sums=('8bfd53a74df6773e13492640328a57426268a092')

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/share/doc/$pkgname/{AUTHORS,COPYING,NEWS,THANKS,TODO}
}
