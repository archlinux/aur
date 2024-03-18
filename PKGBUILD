# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cisPath
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Visualization and management of the protein-protein interaction networks"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('958a35281b9aa98b2d5c3a5c4e9c8824')
b2sums=('6c481e29e057a916b9302de8e6027926d12bf449eedf8f10a192e34397eff5091c1e8efbcde5e831fe08d25327e30592f5d43502f076b7d54db1f513756d56d5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
