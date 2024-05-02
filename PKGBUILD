# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRNApath
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Pathway Enrichment for miRNA Expression Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.1-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c31549487f7ea690756db91fef9599af')
b2sums=('a8a917c17017984a8abd011d487bdcee681bdd1aae8348c945f07691b2f4d6491be385297af9cd5372e0e045cffcc8c54d7d176c8fa499ad568ab7c6e12fb799')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
