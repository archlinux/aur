# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FScanR
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Detect Programmed Ribosomal Frameshifting Events from mRNA/cDNA BLASTX Output"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('493abc70911c8ecce2e574a7f8b2366a')
b2sums=('0919b0a4cd8a322d9221e3bb20d9a81f21bf8ad1f9cd5bd6be242f8e02c3b1b390ff4fe9c58b1ca86e18837c3cd4c77410df29102563c24b023bbfa20dbd417c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
