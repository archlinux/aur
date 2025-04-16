# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=limma
_pkgver=3.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Linear Models for Microarray and Omics Data"
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
md5sums=('7b6bac74854c1d58ea22beb575f7e17c')
b2sums=('55f7e69bfda0dfd9f918df8f415fc716edaa23dbfb4c4fd399c20340063b2ac611c2db4b37f695203712477a42eae8b169945ca81e1b5e0f6fd13a0530e5a3ee')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
