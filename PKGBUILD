# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pepXMLTab
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Parsing pepXML files and filter based on peptide FDR"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-xml
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('58e890e1c7baeea5c3a343feac06efa0')
b2sums=('d92a356c8cead1994cac8b22365edcb49814d4b69ac8436c35db30f90de59f0e5bf980e7870b5307b94d55dfa19dd4363a5d97f5c4bfbf8e2e15be1536b7cd83')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
