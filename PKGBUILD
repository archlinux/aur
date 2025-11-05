# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stemHypoxia
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Differentiation of Human Embryonic Stem Cells under Hypoxia gene expression dataset by Prado-Lopez et al. (2010)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fe14af38cd074d51cc3b649e7ce5c7ff')
b2sums=('94ceefbb5c61b66b673948f5a8446878502db77c8e08bb698e938eb0530ce7163f5e75e0ebc9008820bfa9179a53f0cb7abdf4b73706d7e7b6b839dd5bdb52dd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
