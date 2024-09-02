# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=rgbepp
_pkgname=RGBEPP
pkgver=0.0.2
pkgrel=3
pkgdesc="Reference Genome based Exon Phylogeny Pipeline"
arch=('x86_64')
url="https://github.com/starsareintherose/$_pkgname"
license=('GPL-2.0-only')
depends=('fastp' 'diamond' 'spades' 'java-runtime' 'macse' 'parallel' 'findutils' 'bash')
makedepends=('gcc' 'cmake' 'make')
source=(https://github.com/starsareintherose/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('eb493da89ccba95d43b1f99e36fc793b787340fc203fc99a7eb3111bd2de2d65')
build() {
  cd "$_pkgname-$pkgver"
  mkdir -p build && cd build
  cmake -DCMAKE_CXX_FLAGS=""  ..
  make
}


package(){
  cd "$_pkgname-$pkgver"
  cd build
  make DESTDIR=$pkgdir install
}
