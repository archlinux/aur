# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=dendsort
_pkgver=0.3.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Modular Leaf Ordering Methods for Dendrogram Nodes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-gapmap
  r-gplots
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-seriation
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aa431b861ec9dad6da1cfeb2b923edb9')
b2sums=('e77a0a27461573c8e7e53b919ad62a42e8e5be56c35f18d3555ea2604c3625cc3432f7840dcf0735d85e74a0937e5430a4f420c797c0d9b99a348fbe233d0866')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
