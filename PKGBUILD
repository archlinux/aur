# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mygene
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Access MyGene.Info_ services"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-genomicfeatures
  r-hmisc
  r-httr
  r-jsonlite
  r-plyr
  r-s4vectors
  r-sqldf
  r-txdbmaker
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('03cc8009d4335035f1f6331375b12db7')
b2sums=('d69a0637af678b67b9f098d9ca56786ad89d8af5a651a89682ad1cd71ad97c1f65029c5d3d7e409f395bccabcc2853ed6acfbf2b938af7a8fc3986eec321b3b1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
