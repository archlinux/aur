# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=timeprefix
pkgver=2
pkgrel=1
pkgdesc="Prefix each line with the time it as written"
arch=(i686 x86_64)
url="https://github.com/maandree/timeprefix"
license=('custom:ISC')
depends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(00961089a5c56b41b0bf53da23818874dfeeb7644cf32a4e126df788d6f4d2e1)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}
