# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BDMMAcorrect
_pkgver=1.18.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Meta-analysis for the metagenomic read counts data from different cohorts"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  r-ape
  r-ellipse
  r-ggplot2
  r-rcpp
  r-rcpparmadillo
  r-rcppeigen
  r-summarizedexperiment
  r-vegan
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7dae9023d884c07857b4378154d8912b')
b2sums=('763218d7acbe8bfce7e19e6834c281fd2086a402da0cedfd52f32d320f7fa91ff8de816fa266d4e5e4358312e2b9dbe0360c640cbfcf0123a4e24fb61235f848')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
