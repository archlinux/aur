# Maintainer: Christos Longros <chris.longros@gmail.com>
pkgname=r-ankir
pkgver=0.2.0
pkgrel=1
pkgdesc="R package for reading Anki flashcard databases with FSRS support"
arch=('any')
url="https://github.com/chrislongros/ankiR"
license=('MIT')
depends=('r')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chrislongros/ankiR/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d96e7377bae99eb7696d4a5d752e55ef18c2323e4010ac2573e016696a3ae411')

build() {
  cd "${srcdir}/ankiR-${pkgver}"
  R CMD build .
}

package() {
  cd "${srcdir}/ankiR-${pkgver}"
  install -dm755 "${pkgdir}/usr/lib/R/library"
  R CMD INSTALL ankiR_${pkgver}.tar.gz -l "${pkgdir}/usr/lib/R/library"
}
