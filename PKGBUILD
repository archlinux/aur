# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=chibi-scheme
pkgver=0.9.1
pkgrel=1
pkgdesc="minimal R7RS scheme implementation for use as an extension language"
arch=(x86_64 i686)
url=http://synthcode.com/wiki/chibi-scheme
license=(GPL)
depends=(bash glibc)
source=("http://synthcode.com/scheme/chibi/${pkgname}-${pkgver}.tgz")
sha512sums=('64a68e06174e326c3f3c29573483fd2af9aee26e3fb3074ad9dc46a3a46c2ff642ec1ffb07d28850215527fb6a0d1fac25e0e416024bd228328e9ea423dd7324')

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
