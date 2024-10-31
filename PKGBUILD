# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Informeasure
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R implementation of information measures"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-entropy
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b52fbbdf221f0437533a025776f59940')
b2sums=('25122fb02a614fce85dedb19226905afacf264ca9c098dc329b28192dac9cd3d435c4140aec98cfa5c3b13113f63c58302ff577d5a77a239abf057e30b80f62b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
