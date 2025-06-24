# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=directlabels
_pkgver=2025.6.24
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Direct Labels for Multicolor Plots"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-quadprog
)
optdepends=(
  r-alphahull
  r-dplyr
  r-ggplot2
  r-ggthemes
  r-inlinedocs
  r-knitr
  r-lars
  r-latticeextra
  r-markdown
  r-rcolorbrewer
  r-rlang
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('17ba0a577d63b0372fc1f9f9ea4b72fa')
b2sums=('8a3cde14235de9fa4c17c373f39e27f88cf945f6df61746fe5aa8d792aadf8e6cb7f3ad0e1636b11556e8bf9ef73909d03fa020ede6bb39c15f38e52ccd96bd5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
