# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gscreend
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis of pooled genetic screens"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-fgarch
  r-nloptr
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ccea408ff7467a43781ff731f14599f')
b2sums=('95b10c64420c8f9851c3730381a5995da9efe0149592053bce09e87e6ea33a3d922a181ae2818de980875b76f64c804d2a44fbe9da2d9554fb8ec57703a08823')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
