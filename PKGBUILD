# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=texman
pkgver=1.1
pkgrel=1
pkgdesc='Texinfo-like syntax for manpages'
arch=('any')
url='https://github.com/maandree/texman'
license=('custom:ISC')
depends=('perl')
checkdepends=('perl')
makedepends=('perl' 'coreutils' 'make')
source=(texman-$pkgver.tar.gz::https://github.com/maandree/texman/archive/$pkgver.tar.gz)
sha256sums=(e1a811b6d84cf88785e1801841f2e972c4dda90559f0368efa3ab7034d064719)


build() {
  cd "texman-${pkgver}"
  make PREFIX=/usr
}

check() {
  cd "texman-${pkgver}"
  make check
}

package() {
  cd "texman-${pkgver}"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
