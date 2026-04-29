# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tkWidgets
_pkgver=1.90.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R based tk widgets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-dyndoc
  r-widgettools
)
optdepends=(
  r-biobase
  r-hgu95av2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('72c4a99bef0426b0a70bd2d2fd267c65')
b2sums=('fb92d491662103e0fff5916653bbf78d9c63239aeaeda623839bfebd9ac213f93c439f085b42a4e1655f840d9f4cf3c989a052518c4c52d61bec24c78a13f2e3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
