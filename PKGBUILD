# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=chibi-scheme
pkgver=0.10.0
pkgrel=1
pkgdesc='Minimal R7RS scheme implementation for use as an extension language'
arch=(x86_64 i686)
url=http://synthcode.com/wiki/chibi-scheme
license=(GPL)
depends=(bash glibc)
source=("http://synthcode.com/scheme/chibi/${pkgname}-${pkgver}.tgz")
sha512sums=('b1b0b9d1f6fdbe13f5b4849b4af287bb423ef6a20b82bd966a6739320542b825767a2383f82c8133306e4b59676c860a9916c8425720df26756e7b0cc38c8c46')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="/usr"
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="$pkgdir/usr" install
}

check() {
  cd "${pkgname}-${pkgver}"
  make test
}
