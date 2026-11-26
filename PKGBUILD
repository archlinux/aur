# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethTargetedNGS
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Perform Methylation Analysis on Next Generation Sequencing Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  hmmer
  r-biostrings
  r-gplots
  r-pwalign
  r-seqinr
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6a6cdb7f5338db26785d39beeef99e99')
b2sums=('c292977e6c62ce9726c7320bf11b29e7d64814f833dd38c696487429b72e73c6c58b5d59855b22be401ffbe639bcd6b1d0d1bd050288d4fc7d6bab6dbd1e879e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
