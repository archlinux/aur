# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=solar-python
pkgver=2.4
pkgrel=1
pkgdesc="Solar data calculation and prediction library for Python"
arch=(any)
url="https://github.com/maandree/solar-python"
license=('AGPL3')
depends=(python3)
makedepends=(make coreutils python3 texinfo)
install=solar-python.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(fda9576e26d4e46989d36cfba0208bf7167a063c4f5b62cf9c7f9a0bfacfb740)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1)" PY_MINOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 2)"
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1)" PY_MINOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 2)" install DESTDIR="$pkgdir"
}

