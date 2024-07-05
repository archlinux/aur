# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=rgbepp
_pkgname=RGBEPP
pkgver=0.0.1
pkgrel=0
pkgdesc="Reference Genome based Exon Phylogeny Pipeline"
arch=('x86_64')
url="https://github.com/starsareintherose/$_pkgname"
license=('GPL-2.0-only')
depends=('fastp' 'diamond' 'spades' 'java-runtime' 'macse' 'parallel' 'findutils' 'bash')
makedepends=('gcc' 'cmake' 'make')
source=(https://github.com/starsareintherose/MiMi/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('66d179a7c82110f094cc414d4860601b8c28434875a30c05ec3841df52e086d1')
build() {
  cd "$_pkgname-$pkgver"
  mkdir -p build && cd build
  cmake ..
  make
}


package(){
  cd "$_pkgname-$pkgver"
  cd build
  make DESTDIR=$pkgdir install
}
