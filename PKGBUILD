# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pgca
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="An Algorithm to Link Protein Groups Created from MS/MS Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('43c58c5b347ebf060a9e6afdc8aa8e93')
b2sums=('a43e7b2f25a506f917960ab0d193f7399db2d82bd82f2e164b0eb8f9b80fc90252ab3750aaddffe31ef349252f011566f31fc6715930a272cdbe1f3b082b715a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
