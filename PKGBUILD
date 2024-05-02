# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PLPE
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Local Pooled Error Test for Differential Expression with Paired High-throughput Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
  r-lpe
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e85184a43fa18098e2371b6596fd9743')
b2sums=('1ea8b7e89c2f94f9003e8f0df0871235c485ef1fe18a89ff8ab21c10c4ff06cdb35f4b6b19a162bf2d14284eb330f2dee7825d60390e188aa3022412b88412f8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
