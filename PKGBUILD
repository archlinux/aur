# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=join-python
pkgver=1.1
pkgrel=2
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
  make PREFIX=/usr DESTDIR="$pkgdir" PYVERSION="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1,2)"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" PYVERSION="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1,2)" install
}

