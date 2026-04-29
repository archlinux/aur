# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=optimalFlowData
_pkgver=1.23.0
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
md5sums=('96805faec606968986303b8193471d43')
b2sums=('8f2a944cfcd84d9a31bb50327f487a971eba87e819bb00eae97cd5981d96c5923918554df5c782f954b2ac680bcdd46904e1477bb88b96f0a8cd29e23253a3f2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
