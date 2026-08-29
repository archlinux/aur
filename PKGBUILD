# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PeacoQC
_pkgver=1.22.0
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
md5sums=('2b10a5dc2e383344303ca907d240afd4')
b2sums=('5e86433f12e49855b55c796891c9a62fca9b31b401acf68ec3fc6b7024a87d24aa7131d671ed269b91549875357e525f214d3092172a989091f6d74e9569e91d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
