# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=similaRpeak
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Metrics to estimate a level of similarity between two ChIP-Seq profiles"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-r6
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-genomicalignments
  r-knitr
  r-rmarkdown
  r-rsamtools
  r-rtracklayer
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('326a9c389d85c0e026cad982ae4aa5cd')
b2sums=('c4220459e73550c91b52907bd63e5aec9ede7fa884dcd29dd0034a74d938c4dfec1536c2a1fbd3d050d14553411cfb869a420bdca7bc5b3457918a385c777a7a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
