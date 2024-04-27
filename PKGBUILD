# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nullrangesData
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="ExperimentHub datasets for the nullranges package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-experimenthub
  r-genomicranges
  r-interactionset
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c8b4cf63d70a2577251c03c093c014b1')
b2sums=('17c3004393ca6181bc3e10639ee160071c78272b889aa62d44fdce8a09e9e1b89d3b86bed8941ce594bdbe9a6ed155ed18548ab01696b48031fc5ba1ab16fea7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
