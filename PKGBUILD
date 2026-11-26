# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethPed
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('b2e3df06a4b095ea1150bcd5c10672fe')
b2sums=('b12cdaf17a5df54bf2b4680bada83bfb1e58018ff3d7191fbe5abd3c0163b9c7c6421ec544cc3ebf891b17780177332b73f038b77cfbcf56dabdb69348376143')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
