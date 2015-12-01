# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=median
pkgver=1.2
pkgrel=1
pkgdesc="Calculate the median values for a set of groups"
arch=(any)
url="https://github.com/maandree/median"
license=(GPL3)
depends=(python3)
makedepends=(make coreutils texinfo)
install=$pkgname.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(e988111e206ecfb7fae08218997f919179d25be6a88d9c8cbbc1388bb6e665d9)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

