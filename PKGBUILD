# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ttservice
_pkgver=0.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Service for Tidy Transcriptomics Software Suite"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-dplyr
  r-plotly
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('00aad30026ae11ace76d7e6f79e815c6')
b2sums=('09ade096865a69f3b67599b40eb56f436453ad028bf07aed7ef095e3dc677ac3710bdd8bdfc13d791e64ad196636b9f03ad6d8f20968e29cbf64e9cc22980dcc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
