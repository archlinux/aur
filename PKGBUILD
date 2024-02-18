# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rols
_pkgver=2.30.2
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
md5sums=('110adcc1a5828a39f693a67d92f08b9e')
b2sums=('84b3415051d752781cd81e939583f6235c6b271052778e6899a1a56af8e794c7bcdff588e0cc8d52fdaf5b4985790745ca0d9d495743fcbe526dc87db1e81bfd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
