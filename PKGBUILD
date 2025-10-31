# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=edgeR
_pkgver=4.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Empirical Analysis of Digital Gene Expression Data in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r-limma
  r-locfit
)
optdepends=(
  r-annotationdbi
  r-biobase
  r-biocstyle
  r-jsonlite
  r-knitr
  r-org.hs.eg.db
  r-readr
  r-rhdf5
  r-seuratobject
  r-summarizedexperiment
  r-arrow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('44c27cacf9b9ad91d2805ec2703bb98e')
b2sums=('f6eb53e90e290eee9d055c89075c88d33928dc09eb151fe7e1057d913a53705aecaddb526e69c0166274677e21d16ec91133082ab9074518b74bf14ac4b49392')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
