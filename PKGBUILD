# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RIPAT
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Retroviral Integration Pattern Analysis Tool (RIPAT)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biomart
  r-genomicranges
  r-ggplot2
  r-iranges
  r-karyoploter
  r-openxlsx
  r-plyr
  r-regioner
  r-rtracklayer
  r-stringr
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d60e0694d56d610628f20d996efe258b')
b2sums=('933377da51143c7af6ee2f3033a5c166b92fe51eeaeddaad6440191c04f7e1f31bd9ab049a54f32bc8899e7347023bf1e0107e82c1d615d126d971ac052aeea8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
