# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libenv
pkgver=1.0.3
pkgrel=1
pkgdesc="Environment sanitation library"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libenv"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(7d42dd6376cdc1cc81ea4afa59f8e0d1e11b80d9fc0cdd7a94ccc6f4d06d0a07)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
