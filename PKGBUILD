# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Heatplus
_pkgver=3.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Heatmaps with row and/or column covariates and colored clusters"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rcolorbrewer
)
optdepends=(
  r-biobase
  r-hgu95av2.db
  r-limma
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2fc31223abae7097ed60fe4a2a61e26f')
b2sums=('53d16939266a56feec3060c38c6237949254221cf125bc841fc6656d4e2cd5786e1a00a12b4a5d15ffd3f8a1d339dc10ad63e316fc2b5ef8ab3a785a9b80b077')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
