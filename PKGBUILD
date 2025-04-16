# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=logicFS
_pkgver=2.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification of SNP Interactions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-logicreg
  r-mcbiopi
)
optdepends=(
  r-genefilter
  r-siggenes
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1601a946b0262c7a79179e8f4d70b800')
b2sums=('f02c7a825e8621eea5ccbb5c15ce858bbcbc1f33b06356126feb689a8c82a47417d0d2c5a160d767c737964ad2bb03d0708e9c4fb782a7cc910977e3560de7cf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
