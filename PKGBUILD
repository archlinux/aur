# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSEAlm
_pkgver=1.66.0
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
md5sums=('2c7b3b95a50d2fcc962e5693be5142cb')
b2sums=('83cdf1856685c58c0c7f57ff18c7fdb361f9030b67dd6955edd1a0216eb0a4974fa411af72260f891e03769174572b56c6c86af06845146401f504fb27cc608f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
