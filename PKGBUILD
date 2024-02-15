# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sscore
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="S-Score Algorithm for Affymetrix Oligonucleotide Microarrays"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-affy
  r-affyio
)
optdepends=(
  r-affydata
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3f61e0bf6176b6ee7f4b29b0af6e2091')
b2sums=('1a9672fd09cfb1a4ea6cb695a352111db352502a1d1cc5b93102143441ebc30400ca7d6c9061966c7311e001ad1a1105dcf6ead4e1a54bf8eda79004f772dca8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
