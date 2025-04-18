# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MOFAdata
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data package for Multi-Omics Factor Analysis (MOFA)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-multiassayexperiment
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b3ad33509c675cdb04fede568a7d47a2')
b2sums=('bec9e47986dbda54e5de781e3f4cf5e9ac58188ffd95fb1ebb24f61278f35d5ff0ecfd29f7e30198776d41c8c9eabca7d3259299887609b079ebbf95cb757b1f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
