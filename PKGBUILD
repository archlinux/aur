# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=pylibgamma
pkgver=1.1.3
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and Python 3"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/pylibgamma"
license=('custom:ISC')
depends=(python3 'libgamma>=0.6' glibc)
makedepends=(python3 'libgamma>=0.6' glibc make gcc cython coreutils pkg-config)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(09b4225384e5d8d0d55323b97d57ec435326275f935e41097eddbc9953c4bb33)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr PY_MAJOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1)" PY_MINOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 2)"
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr PY_MAJOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1)" PY_MINOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 2)" install DESTDIR="$pkgdir"
}
