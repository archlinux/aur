# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DTA
_pkgver=2.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Dynamic Transcriptome Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-lsd
  r-scatterplot3d
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cc6d4e1176b55830b0ae352349c7e98c')
b2sums=('3b792ef5f176c809923f863a1a7885b451b331ce20cae93e7118695e77d60fd4f913f1d27f3695c87236b8c9060e90795925e6c486d88e777155fa740a48276f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
