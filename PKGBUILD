# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethTargetedNGS
_pkgver=1.42.0
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
md5sums=('3860ee1b9d205f60200dd62c3de3bae9')
b2sums=('dc540067bca73a97ac453a774a65b6fc0efc98c9165d33b18b6e320b47e5b317a18903a335c830d7ad31af300a4307f0f8579edadefc261cce62d1bca2a12da3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
