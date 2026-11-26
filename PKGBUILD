# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gscreend
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis of pooled genetic screens"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-fgarch
  r-nloptr
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ebea32a0cd122797bc12b1591cd0fd14')
b2sums=('5071f548bd1ef631518a15020c3cf77c97d6ae2ec8043354ebbc299ad0a617b8de05be1ea958d12b406c68c7634bd649b7a8736afa1c2b6a09f0d8678e8ed813')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
