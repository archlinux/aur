# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GIGSEA
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genotype Imputed Gene Set Enrichment Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-locfdr
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3afa46865e52305c75e6447665767b15')
b2sums=('bc483f94bc032c3ee03d18b82a9c6a20d542af72d6abe555faa14b0967a7de33021b252507ab5e4c15c65aa73bd977f8576618cc83b9c481b7b4ee01946874a2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
