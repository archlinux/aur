# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methylscaper
_pkgver=1.8.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Visualization of Methylation Data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
depends=(
  r-biocparallel
  r-biostrings
  r-data.table
  r-rfast
  r-seqinr
  r-seriation
  r-shiny
  r-shinyfiles
  r-shinyjs
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-r.utils
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c2bae24f7f0fd7284a2faf5f6fea4f09')
sha256sums=('f9782ec9f9839dc5e3c5521ac6b7429f0a4c4a17fa50da3cbc979a2e6c19dbd8')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
