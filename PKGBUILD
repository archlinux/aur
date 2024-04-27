# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SiPSiC
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Calculate Pathway Scores for Each Cell in scRNA-Seq Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-singlecellexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b8de9b61ecec686d20b8b3a4383cb6f9')
b2sums=('57cccba30b6234007363d8ad24959753fd18c714a32357e26fe70614645a4ddae96002af0a2c4190b5c77637bce6cfdfe46dbb58c773c20d1f2a3768fe317756')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
