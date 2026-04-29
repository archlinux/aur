# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pepXMLTab
_pkgver=1.46.0
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
md5sums=('815440489861e7c0994c41a05e269887')
b2sums=('fa78dd84cc7cbaefdbbdb723f44bf41bd75ff8e8cba19018e017683c1759cea958f1a217027477a941a30ad674a3a6ca375bf472ecd6bfa6572ff40aa5d1eae2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
