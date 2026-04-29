# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rcellminerData
_pkgver=2.33.0
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
md5sums=('9dc86d58de03e9a0d9da387c826006e6')
b2sums=('19c41e80f8e9cb2551f5bbcc3ef11105622c84611014268868d635998c6f78c4f16fc153542e60e1f106aadc31270effbcbe586ab9b7d292cfa0177d0503cd7f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
