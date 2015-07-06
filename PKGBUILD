# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Roman Lapin <lampus.lapin@gmail>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gdsl
pkgver=1.7
pkgrel=1
pkgdesc="A collection of routines for generic data structures manipulation"
arch=('i686' 'x86_64')
url="http://home.gna.org/gdsl/"
license=('GPL')
depends=('bash')
options=('!libtool')
source=("http://download.gna.org/gdsl/$pkgname-${pkgver}.tar.gz")
md5sums=('56cdaa3235b58f8b16a32dfc93ae7dde')
sha1sums=('1eb7571bc045c98a99ff36be516dfd79c288b10c')

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
