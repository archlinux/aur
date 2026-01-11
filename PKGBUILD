# Maintainer: Christos Longros <chris.longros@gmail.com>
pkgname=r-ankir
pkgver=0.1.0
pkgrel=1
pkgdesc="R package for reading Anki flashcard databases"
arch=('any')
url="https://github.com/chrislongros/ankiR"
license=('MIT')
depends=('r')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chrislongros/ankiR/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('13c264aade21dbfbb15f2e4279e83ce1f8fb3fd6f96f5b90defc9ef1a473df76')

build() {
  cd "${srcdir}/ankiR-${pkgver}"
  R CMD build .
}

package() {
  cd "${srcdir}/ankiR-${pkgver}"
  install -dm755 "${pkgdir}/usr/lib/R/library"
  R CMD INSTALL ankiR_${pkgver}.tar.gz -l "${pkgdir}/usr/lib/R/library"
}
