# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PeacoQC
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Peak-based selection of high quality cytometry data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-circlize
  r-complexheatmap
  r-flowcore
  r-flowworkspace
  r-ggplot2
  r-gridextra
  r-plyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6a1a43bc3f0a718550edbd585a46339f')
b2sums=('1a566cbcf80da7afa4512814cc7320f3b31ba2ede445e2e0817e9185c0a000a675977e34d16fcebab1a675ffd399c401e9b270dad793d8230a1cb5252a52a54f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
