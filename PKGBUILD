# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Heatplus
_pkgver=3.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('459fb0dbd1242699e9f394f156a7e0c1')
b2sums=('62b75f5ac21d00b52c73c780143ac164df1c94680ae3a9aba80bc8d15351c8928525e6931352ed757f81c13b0d24ae14cf20c2900d4683d4376c043608bcce9e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
