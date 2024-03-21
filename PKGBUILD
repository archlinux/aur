# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ensemblVEP
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Interface to Ensembl Variant Effect Predictor"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-biostrings
  r-genomeinfodb
  r-genomicranges
  r-s4vectors
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('378569d68f5d4973a7b16eb7cc2b9327')
b2sums=('567065cc42b2013cb4d6bdcc8fa27b32f94f42d9df58497019e0b081802249e08d6c21cabdc8b1d10d2df51edfd2661ab1272e2ea84eb255b33ce5060befc79a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
