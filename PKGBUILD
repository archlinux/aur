# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethPed
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A DNA methylation classifier tool for the identification of pediatric brain tumor subtypes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-randomforest
)
optdepends=(
  r-biocstyle
  r-impute
  r-knitr
  r-markdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('57b633da5d8548342b0a2071efe3c04d')
b2sums=('467cd4c4fc992e901a5c1367063175c73e4ee535d1a1be3a77714238533644ed55af92b2118f442443ce647b23044135cf4600e2dce0c4b7a4dbb3f68fd6b0f6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
