# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=pylibgamma
pkgver=1.1.1.1
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and Python 3"
arch=(i686 x86_64)
url="https://github.com/maandree/pylibgamma"
license=('GPL3')
depends=(python3 'libgamma>=0.6' glibc)
makedepends=(python3 'libgamma>=0.6' glibc make gcc cython coreutils pkg-config)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(cb9dec5115b518bac4af8706ab33c78d9d04ce24de5692db16988499eb90f8a2)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1)" PY_MINOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 2)"
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1)" PY_MINOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 2)" install DESTDIR="$pkgdir"
}

