# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MEIGOR
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MEtaheuristics for bIoinformatics Global Optimization"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cnorode
  r-desolve
  r-rsolnp
  r-snowfall
)
optdepends=(
  r-biocstyle
  r-cellnoptr
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0dbaa957e4f6f08b24ae29007b73518f')
b2sums=('e3d1c1ef4268f20d7c485664cffab9533f768a052b490863486190ee8e39eca23cd8936e8fc41ab036454bfa3e4e85448d3bd1616c4b629028894616a29c194c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
