# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PeacoQC
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Peak-based selection of high quality cytometry data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-circlize
  r-complexheatmap
  r-flowcore
  r-flowworkspace
  r-ggplot2
  r-gridextra
  r-plyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fa296e0522b97273b692874b5ec23b97')
b2sums=('dd18e3e1c267e1d0c75c967c5c01f5a0d8b8e0cdf8b8588aae83a79c62f34bfd39ce715a78380292edfb0d67c9eb734e813948580683a1806c7c52ef96b6f204')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
