# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=directlabels
_pkgver=2025.5.20
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
md5sums=('e162f73ef19826b83318f2cc138611b4')
b2sums=('6ea83870728c844878eb73d744a5013eb0d998d685a817fb44d53a92921773e9eff3285d5b48183670ce51663570ca52ef2a69c907854b29c50705e7a0d18e49')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
