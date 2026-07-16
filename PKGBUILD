# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cytoMEM
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Marker Enrichment Modeling (MEM)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-flowcore
  r-gplots
  r-matrixstats
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bdf7086b65890966bed7359aea6e302e')
b2sums=('024a7e92e160474dd6abf1e1773df1ac154b482ba3b1e74eab2568ffc7799f896268b4941956ffb27ce913a9bd27c1afd90c8811c26157fac4619dce48cd0e88')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
