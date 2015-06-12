# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=analyse-gamma
pkgver=1.0
pkgrel=1
pkgdesc="Gamma adjustment analysis tool"
arch=(any)
url="https://github.com/maandree/analyse-gamma"
license=('GPL3')
depends=(python3 pylibgamma)
makedepends=(make coreutils)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(16e4171462a9685bf8ef0970a4ce2b2a768fcc7ba6e598310e4deb2eb3facf38)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PKGNAME=analyse-gamma
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PKGNAME=analyse-gamma DESTDIR="$pkgdir" install
}

