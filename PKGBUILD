# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spkTools
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Methods for Spike-in Arrays"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
  r-gtools
  r-rcolorbrewer
)
optdepends=(
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a1a83ff154c3c0c08103ed53c801919e')
b2sums=('3cdd54a0f9e98d911f69f134ae887e990130c977f4c0f9bf81cc11811594bcfb92b035dc76bbdb05284aaaa2e3880ae19feec648ef3125903221becc0a2af87e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
