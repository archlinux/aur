# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=solar-python
pkgver=2.5.2
pkgrel=1
pkgdesc="Solar data calculation and prediction library for Python"
arch=(any)
url="https://github.com/maandree/solar-python"
license=('custom:ISC')
depends=(python3)
makedepends=(make coreutils python3 texinfo)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(6f191d8c1012770a6016146b5c3880388f936d1f85c41e81c0b0ebc379785722)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR=3 PY_MINOR="$(python3 -V | cut -d ' ' -f 2 | cut -d . -f 2)"
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR=3 PY_MINOR="$(python3 -V | cut -d ' ' -f 2 | cut -d . -f 2)" install DESTDIR="$pkgdir"
}

