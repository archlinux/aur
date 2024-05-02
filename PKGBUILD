# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethPed
_pkgver=1.32.0
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
md5sums=('bc972ab3fb55451ebda07d6605de5a3f')
b2sums=('b1c291c5ad01a137da312767e4f08c9d903e04281713e3abf67a7641a7b9a0d045015127ab5925d67c873293a0b44736bce199601b56cebf43da7058ad4715f5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
