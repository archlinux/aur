# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oneSENSE
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="One-Dimensional Soli-Expression by Nonlinear Stochastic Embedding (OneSENSE)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-flowcore
  r-gplots
  r-plotly
  r-rtsne
  r-scatterplot3d
  r-shiny
  r-shinyfiles
  r-webshot
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c89540d29c09f4cb0e00a650ca5a7f20')
b2sums=('7e94e918dc4b35a74e435bf2530840b3398e3cfd5fb3a705c608f04d71b425f3735b3536e2a654b4296250a84671ba3702ea3967ca68462be3ddcd973e88c4d5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
