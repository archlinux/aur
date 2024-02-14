# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rols
_pkgver=2.30.1
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
md5sums=('dae024b25d99cb24428d289e1b629f36')
b2sums=('a19ab587b84c0450cc411479dc472f427fa598ccebc16c20f2b7841bc84e1c3d9537da5eabb7086fabdf41370f4f894fc704f598d75d8ef67fd189634ac54060')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
