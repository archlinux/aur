# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RIPAT
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bd4406d3915176597b1b15ed47fc7e8a')
b2sums=('1c8eac8c7dd7631a67591c367f3252467c067640611a850799717c268b7c8f77536027483c7f71073ec691e32d477fdd1e942f58d627f61e05f03087d430978b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
