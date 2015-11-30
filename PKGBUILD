# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=analyse-gamma
pkgver=1.2
pkgrel=1
pkgdesc="Gamma adjustment analysis tool"
arch=(any)
url="https://github.com/maandree/analyse-gamma"
license=('GPL3')
depends=(python3 pylibgamma)
makedepends=(make coreutils texinfo)
install=analyse-gamma.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(163ce04b24a16d8e1aa6b751be13c7f00d0d883ad33091ee48d568d74ec620e9)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PKGNAME=analyse-gamma
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PKGNAME=analyse-gamma DESTDIR="$pkgdir" install
}

