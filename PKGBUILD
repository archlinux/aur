# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Heatplus
_pkgver=3.22.0
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
md5sums=('fdd498785d728c17163d8da1e78cca40')
b2sums=('6a2ccb3366aa0698801bca6eb2ab25ea98c12a04c460bf9fc958d75e055dd9af2e5408473bd06d4f8fd2069985f395efc753c4775588e22aa26c5c2d01b2e3a1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
