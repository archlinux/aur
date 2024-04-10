# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dupRadar
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Assessment of duplication rates in RNA-Seq datasets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rsubread
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('306ba6ddb1786eb7ec5e6cb4bc15562e')
b2sums=('1f7d80cc1c01eb31511393419a03fd8c460c409c996001e29a4dbcd3dbcce0a2e58c05d71f707c3d7d14668f953ed4b7920bf6f5bc0b197a31c2547eb3b396d1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
