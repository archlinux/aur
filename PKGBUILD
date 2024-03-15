# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fit.models
_pkgver=0.64
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Compare Fitted Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f0e7d6414bdf7ad3269c35af0b83503d')
b2sums=('d8d3752d70228c4323ff2915a32bf9a6ba035d164fe9f3e4d1f959aca85ca1c08443b0cf6e8c2d433737e59096728402285462a3caf8746d58caa2d45d86f74f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
