# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=analyse-gamma
pkgver=1.1
pkgrel=1
pkgdesc="Gamma adjustment analysis tool"
arch=(any)
url="https://github.com/maandree/analyse-gamma"
license=('GPL3')
depends=(python3 pylibgamma)
makedepends=(make coreutils)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(2ba959788687749de6859dd1e8751d3583c1d8c19c0030067cb04f5e2a1aae75)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PKGNAME=analyse-gamma
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PKGNAME=analyse-gamma DESTDIR="$pkgdir" install
}

