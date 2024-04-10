# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=wheatmap
_pkgver=0.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Incrementally Build Complex Plots using Natural Semantics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-colorspace
  r-rcolorbrewer
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('93f820bace140900b65cb8c128eb4b6e')
b2sums=('7b2ee688ba41121a5dadadcc674c62d6d7769f1e2cd19237614d9efd431bb595c53313b8202ecaf6182be40a112b73b5d86bdbbd959b7de2bd9a626350e8e7df')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
