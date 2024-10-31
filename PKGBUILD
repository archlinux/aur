# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethTargetedNGS
_pkgver=1.38.0
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
md5sums=('a8d565caedbbee4c1e3028b13b58f6c6')
b2sums=('2aa8f2f733ab65821aa731f91845fc3be4d5e1eef01908bcae2af6cfa4be1e2ffb138f21c7af5212fb5e011964c581646345749f75899c6cf4f4ed32cd0c5b8f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
