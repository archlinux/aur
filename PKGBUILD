# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CoRegNet
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="reconstruction and integrated analysis of co-regulatory networks"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-arules
  r-igraph
  r-shiny
)
optdepends=(
  r-biocstyle
  r-gplots
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('57d4b5f625123f9637aa4d696a2eb859')
b2sums=('500c6b1bff3c564cb1967bc154bf91c7b6fcb41a0760a81bbc4b21f389e53143df91eab707739c08e345f2aa78279273a802cb01ae11e15a417a186b597179be')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
