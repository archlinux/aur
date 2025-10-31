# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=optimalFlowData
_pkgver=1.21.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="optimalFlowData"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-magick
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('be628c0defa5936b0634d27ac227e26b')
b2sums=('e165761dee0de8b0190eb0fa59099fb646535959559d88dc1c1964b0fac91c70ae5d4684e7f06c2d0177cc992f6e3c43fcb5d6d94c80984a54c6018cf79100c7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
