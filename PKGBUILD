# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethPed
_pkgver=1.40.0
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
md5sums=('eff74c5d78acad84b0205c53ab48ad7e')
b2sums=('2bab6014f677b62362e4fc58d401367b94296b29839489b991435e4a9602bb3dccdd5132664be8adbf17b95dfd0dc1b42ffe1deb7d6cdf32ee0dd3454c25dcd2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
