# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rols
_pkgver=3.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R interface to the Ontology Lookup Service"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
  r-httr2
  r-jsonlite
)
optdepends=(
  r-biocstyle
  r-dt
  r-go.db
  r-knitr
  r-lubridate
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3cd91882391035473c19de350a04dfb0')
b2sums=('05bc04790ba9750b60a9281100d74feaffece977b7882bb7eb9a09ceb12970727ac594137f8ded93eb8898a8bcae210c0308865735a4bd6d44cdb29a0f735e31')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
