# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=rms-pics
pkgver=2
pkgrel=1
pkgdesc="Download all photos from http://stallman.org/photos/"
arch=(any)
url="https://github.com/maandree/rms-pics"
license=('custom:GNUAllPermissive')
depends=(bash coreutils wget grep sed)
makedepends=(make coreutils)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(01ebb3543d4e4625ec5027e290f5371aed77bd8483f324453a1b730c777e5bec)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

