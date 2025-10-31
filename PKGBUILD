# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PROcess
_pkgver=1.86.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ciphergen SELDI-TOF Processing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-icens
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1d95f3974d3aa090379298fe94d5901d')
b2sums=('773aaf58f05598913ad3cce05cf72b11461ad9f3a9a598d52a2155b15bb68179d5b6ea8cd162220bdda4bb117b720dae47b02ccabafa162941f2344151acd203')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
