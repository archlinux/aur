# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=similaRpeak
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Metrics to estimate a level of similarity between two ChIP-Seq profiles"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-r6
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-genomicalignments
  r-knitr
  r-rmarkdown
  r-rsamtools
  r-rtracklayer
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0ea3a2a1418fb68bb1e76248062b9890')
b2sums=('b18a1bea0d62f22f9c91862c341bafc590494f85675efa25730d7ec80b12fa800f4164a2b98974655374220b0a474e2ced9cecc3f59b380b89cdfa12c4bddd5b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
