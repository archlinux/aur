# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rnaseqcomp
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Benchmarks for RNA-seq Quantification Pipelines"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rcolorbrewer
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('723a0d8d2e5770ef70322d5d94907af1')
b2sums=('43b73be293b8f2d746536ba4328af53036bcb8f695c8abebd4f428fcca1b251a25dbb1e3b70b402db20196c5b28f6337428a964dd0e4916e0b7703efc80f8e21')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
