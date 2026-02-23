# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=solar-python
pkgver=2.5.3
pkgrel=1
pkgdesc="Solar data calculation and prediction library for Python"
arch=(any)
url="https://codeberg.org/maandree/solar-python"
license=('custom:ISC')
depends=(python3)
makedepends=(make coreutils python3 texinfo)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(d324c586d2fc2d953d50f86dc335e53bc766f6a227ede199914c53a6e45f7d33)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr PY_MAJOR=3 PY_MINOR="$(python3 -V | cut -d ' ' -f 2 | cut -d . -f 2)"
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr PY_MAJOR=3 PY_MINOR="$(python3 -V | cut -d ' ' -f 2 | cut -d . -f 2)" install DESTDIR="$pkgdir"
}

