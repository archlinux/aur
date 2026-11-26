# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rcellminerData
_pkgver=2.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Molecular Profiles and Drug Response for the NCI-60 Cell Lines"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-biobase
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rcellminer
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('415ae1bf407452b329885f7ebc9224f6')
b2sums=('20af3b36d3b2ed1527ec84b9231c97a48f2c4d342ac7322d855db9da6a86bf142f592971bbbc355ccf186153c4ccd431679572978d3b5e73600c1d044ca79d4e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
