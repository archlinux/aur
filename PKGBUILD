# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCBN
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A statistical normalization method and differential expression analysis for RNA-seq data between different species"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c58ee707d9418bd3374773e2675efad7')
b2sums=('df517b6e671c9ae5387e543d31c32a988c35a6ac279b78f0a9d910f0d46b0ec94e5a817ce70aa167a034df6065c0285440898b3080d963d4f0112e5eb7b77d70')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
