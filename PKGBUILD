# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSEAlm
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('b88623d080b75bb6775026e9e6c4dd9e')
b2sums=('00622218eab3b7b88d78cef883856afe89f2c15ca58aca3f8754390c5e59fafc4e42288ce0266ddd4c790296a3fc0292ff5be0c752f0ce2fef3d965e3b2e1bba')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
