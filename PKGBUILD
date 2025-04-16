# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Heatplus
_pkgver=3.16.0
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
md5sums=('daee2daff8205bd63acb252c388b0097')
b2sums=('2c68aa85d692b36a13b1d1afe8f0cd35047a69f59ee917b194100a05f26b1bcd94e24341c63aad06228cbc5b75fd696a2706f4152efd014d73154c5e5bcf75ad')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
