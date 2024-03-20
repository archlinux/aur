# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MEIGOR
_pkgver=1.36.2
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
md5sums=('e2b58a616640a53c4a874ce8db88ad7c')
b2sums=('7349ebd71c16d8f1f3000d8245eace7f7f27470799ef377a3b4ff89d4bcca9d0d8cac1a062777de3d6c869bcc4d4ba48f3670aec3bfac355d557b51f3286a679')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
