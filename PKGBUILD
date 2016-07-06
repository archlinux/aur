# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=solar-python
pkgver=2.5
pkgrel=1
pkgdesc="Solar data calculation and prediction library for Python"
arch=(any)
url="https://github.com/maandree/solar-python"
license=('AGPL3')
depends=(python3)
makedepends=(make coreutils python3 texinfo)
install=solar-python.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(fb62ee7ddaafae0ee92d00b4b1efdbb01f5c9eb93bc8e7007379adefed7899a4)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1)" PY_MINOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 2)"
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1)" PY_MINOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 2)" install DESTDIR="$pkgdir"
}

