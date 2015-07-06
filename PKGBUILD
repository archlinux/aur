# Contributor: Roman Lapin <lampus.lapin@gmail>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=gdsl
pkgver=1.6
pkgrel=1
pkgdesc="A collection of routines for generic data structures manipulation"
arch=('i686' 'x86_64')
url="http://home.gna.org/gdsl/"
license=('GPL')
depends=('bash')
options=('!libtool')
source=("http://download.gna.org/gdsl/$pkgname-${pkgver}.tar.gz")
md5sums=('8e242affa5421bfb9b18d27edb990bec')
sha1sums=('2436424d28bef8e0e2ddd559563bf1aa6e8cb701')

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
