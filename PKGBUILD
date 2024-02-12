# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MEIGOR
_pkgver=1.33.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="MEIGO - MEtaheuristics for bIoinformatics Global Optimization"
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
  r-cellnoptr
  r-knitr
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a8c4d636efa888a0984f7e385aa5acf5')
b2sums=('c3fa2d2b01be883613a75e60faf792e0c906a1722b3f93139c014d71678257a32bcf4f9f9e14d93930ddcbd2c6136bd342461d9eb35470430833b09034b5da2e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
