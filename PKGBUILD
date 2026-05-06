# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=optimalFlowData
_pkgver=1.24.0
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
md5sums=('56698e0c5916762b910e42c9d8a44df7')
b2sums=('64688bb98be9458ae9f2c06b8293600e2805cde965cf1f3c5495861d764227c5f88e085eccd80a13da6f821ba2fc543e79a8b4b50cdc1184c5ed0568ddf03ce4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
