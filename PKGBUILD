# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PeacoQC
_pkgver=1.18.0
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
md5sums=('2b158e729dbcc06d9073203703200ad3')
b2sums=('3acd469c02786210adf1c6a13eb0e0403f638c19e0d11f554b1103df90cfb93ce29ad6f0920b52911c610b58d78bb3de4567d31db0b6cac7ac3aeff1ea66825c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
