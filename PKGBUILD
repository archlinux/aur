# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=chibi-scheme
pkgver=0.8.0
pkgrel=1
pkgdesc="minimal R7RS scheme implementation for use as an extension language"
arch=(x86_64 i686)
url="http://synthcode.com/wiki/chibi-scheme"
license=('GPL')
depends=(glibc)
provides=(chibi-scheme)
conflicts=(chibi-scheme)
source=("http://synthcode.com/scheme/chibi/${pkgname}-${pkgver}.tgz")
sha512sums=('f5f3479c25e2df70857ae455de2399adec374114ab540626f8b90f3bf28984d0c7b8479362112921af93f4b509b9c252134bc8c3afe839c56b23001aec837f4f')

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
