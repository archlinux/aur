# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=chibi-scheme
pkgver=0.12.0
pkgrel=1
pkgdesc='Minimal R7RS scheme implementation for use as an extension language'
arch=(x86_64 i686)
url=http://synthcode.com/wiki/chibi-scheme
license=(BSD-3-Clause)
depends=(bash glibc)
source=("http://synthcode.com/scheme/chibi/${pkgname}-${pkgver}.tgz")
b2sums=('2418ccd8d2b10eb4831b4895c048ae7552f732c72fb9ca76ba236256edbd839dab6f729ce85df980670b747ca3e371dadda19fdd5e973e2d8aba4faa9b31ef21')

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
