# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=join-python
pkgver=1.1
pkgrel=1
pkgdesc="Join-calculus for Python"
arch=(any)
url="https://github.com/maandree/join-python"
license=('GPL3')
install=join-python.install
depends=(python3)
makedepends=(texinfo)
source=($url/archive/$pkgver.tar.gz)
sha256sums=('9e463fe40789877e5e9a806f1111c077a29ea01bdc75d8c8913f876ff244b938')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" PYVERSION=3.4
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" PYVERSION=3.4 install
}

