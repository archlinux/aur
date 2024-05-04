# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KEGGdzPathwaysGEO
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="KEGG Disease Datasets from GEO"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('424f49035f4b4b34136f7c576d64198c')
b2sums=('959d03ccfaecb3c86fdb36a505c98d36d930ca983ebc33cc7d3924382d6aa844e7b83656db8c80baf94775f3999f2bd88983ec2eb39c00219e8e4634f2345bcf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
