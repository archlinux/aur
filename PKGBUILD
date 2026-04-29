# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=INPower
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for computing the number of susceptibility SNPs"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-mvtnorm
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1068371ffe75fcfbe1c9656205f0c2f6')
b2sums=('76a738a75b6ed0e391eb4acfa505ced3357ba4d38fc5eb7fbb4087b79af4bd1567e1e89d1db062508b041ead6b07634c97d0a03ee6c26a0bfe71a799548c5c23')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
