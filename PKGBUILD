# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=pylibgamma
pkgver=1.1.2
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and Python 3"
arch=(i686 x86_64)
url="https://github.com/maandree/pylibgamma"
license=('GPL3')
depends=(python3 'libgamma>=0.6' glibc)
makedepends=(python3 'libgamma>=0.6' glibc make gcc cython coreutils pkg-config)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(e40f1291712e799d28eb4b4c5df9fe6b07ce5f0bf39bcd7f9416fb9d3335fb9a)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1)" PY_MINOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 2)"
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1)" PY_MINOR="$(python -V | cut -d ' ' -f 2 | cut -d . -f 2)" install DESTDIR="$pkgdir"
}

