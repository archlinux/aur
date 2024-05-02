# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ReUseData
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Reusable and reproducible Data Management"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-basilisk
  r-biocfilecache
  r-jsonlite
  r-rcwl
  r-rcwlpipelines
  r-s4vectors
  r-yaml
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('afbc33042c2e357b32c82e378f578ba1')
b2sums=('af291ee3598a98152e851e8faaba2abb693072b06215a1f9290d29e34921460c467d8398f4fb19acc2149aeed4b08c09848113db049f406d62d599bb3d296081')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
