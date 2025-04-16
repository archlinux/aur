# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Informeasure
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R implementation of information measures"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-entropy
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1e1cc1b132f3874694569e4fb31c3f8c')
b2sums=('8a657ad4ebb59c04826d6dc3b7e32a904adbb78c7a2b1ad772077da08a013a79c2b51f3d1eb8544a792eb2d93966051afe9c43ab9398eee314659c7839f477c2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
