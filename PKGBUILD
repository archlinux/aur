# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=limma
_pkgver=3.60.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Linear Models for Microarray Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-statmod
)
optdepends=(
  r-affy
  r-annotationdbi
  r-biasedurn
  r-biobase
  r-biocstyle
  r-ellipse
  r-go.db
  r-gplots
  r-illuminaio
  r-knitr
  r-locfit
  r-org.hs.eg.db
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a7307f3e978e37354a8a26524233b9a1')
b2sums=('ec94a5165e4f1485ce67edf2f9d590228e09484f38cf981d4cd4679e96e6c74efc9ea6e754d0e7effa1d51c8a1464e44ba603a23117193e1335f3fd026383f59')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
