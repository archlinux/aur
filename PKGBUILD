# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Rvisdiff
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive Graphs for Differential Expression"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-edger
)
optdepends=(
  r-airway
  r-biocmanager
  r-biocstyle
  r-deseq2
  r-knitr
  r-limma
  r-matrixtests
  r-rmarkdown
  r-summarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5d764525121c4678168a3a25b7263674')
b2sums=('605f857237e7806d7bdd1e3e3daaf5e0d301e5d155a815f19ea672d8fc988d25f31b4d701d2885532ec6fcc2263d77084527d3eb17c610f2c1c7ac2a112f1fec')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
