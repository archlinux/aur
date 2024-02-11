# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genbankr
_pkgver=1.27.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Parsing GenBank files into semantically useful objects"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-biocgenerics
  r-biostrings
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-rtracklayer
  r-s4vectors
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rentrez
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4aa7435552e5594fedc06c9f58165bab')
b2sums=('a13e0720bd39f7c4c1c95b02fa85b76fdef6c5cdf4c67e78fd51e00b183041bd3f26a18ebab136d82153bf698aa470717bddfd863ea3bd3caf79b126739d008c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
