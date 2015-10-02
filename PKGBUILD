# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=solar-python
pkgver=2.1.1
pkgrel=1
pkgdesc="Solar data calculation and prediction library for Python"
arch=(any)
url="https://github.com/maandree/solar-python"
license=('AGPL3')
depends=(python3)
makedepends=(make coreutils python3)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(e1abf24356b9b08a7b50a7ceb40f6d0a43350c74a5ac69dceb73f940b361189e)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1)" PY_MINOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 2)"
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1)" PY_MINOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 2)" install DESTDIR="$pkgdir"
}

