# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSEAlm
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Linear Model Toolset for Gene Set Enrichment Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
optdepends=(
  r-all
  r-annotate
  r-category
  r-genefilter
  r-gostats
  r-gseabase
  r-hgu95av2.db
  r-multtest
  r-rcolorbrewer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1ed083b41dfa39e1c184a665f3c73f7a')
b2sums=('869d2de107039340716192568c187d37c245f5482ec5b8e30ceb4c30c3c759d3b174fa2ec64a3858b8fc316d1379c7faafc59dfaf94e70ad3896d9d3b3b5081d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
