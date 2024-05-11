# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethTargetedNGS
_pkgver=1.36.0
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
md5sums=('69ab4e5fae7355ad1393b9d2a70595d4')
b2sums=('bebcfebce2b3a1a6220c8021590314763b1ca671d709f2e65dd81b06aeb166b20c385ade514da8d005d36e39225c14e9d5e756dfdcda8016236077ab9e220692')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
