# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=solar-python
pkgver=2.2
pkgrel=2
pkgdesc="Solar data calculation and prediction library for Python"
arch=(any)
url="https://github.com/maandree/solar-python"
license=('AGPL3')
depends=(python3)
makedepends=(make coreutils python3 texinfo)
install=solar-python.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(b35d1b6e1f3de9e78b610ac6febecd07ec28fc8bcad9a864afca9ae4cec1e109)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1)" PY_MINOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 2)"
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1)" PY_MINOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 2)" install DESTDIR="$pkgdir"
}

