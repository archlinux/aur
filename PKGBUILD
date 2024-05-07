# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASpli
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis of Alternative Splicing Using RNA-Seq"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-annotationdbi
  r-biocgenerics
  r-biocstyle
  r-data.table
  r-dt
  r-edger
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-gviz
  r-htmltools
  r-igraph
  r-iranges
  r-limma
  r-pbmcapply
  r-rsamtools
  r-s4vectors
  r-tidyr
  r-txdbmaker
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0c318ecaa7d695b92852277fb46a2c05')
b2sums=('fba656c6321a757e9575e53aa57b499f0b40e60ade6e9014b27cd12bb02e9b9260eff3f74395a0b1d56babf37d3a98277f5b2ca0cafc468fa394fefd222cbb50')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
