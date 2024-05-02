# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RGMQLlib
_pkgver=1.23.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="java libraries to run GMQL scala API"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1dc5cd39af77a484c3360d1db80f435b')
b2sums=('7a46a3f5068c183ac39cf4abe8e23de1e2ff5dd2b28798d018dfcb129f03ab53137157124f60fe42b9925528322528253047feb09bc39c1ad2903849974ea386')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
