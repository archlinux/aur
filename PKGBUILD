# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=plgem
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Detect differential expression in microarray and proteomics datasets with the Power Law Global Error Model (PLGEM)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d787be0404cd44b9370237e542a54ca2')
b2sums=('03f4ccfa88407b7cf566b0ddcfaa300841f7099502912a2fd99e733ec2d2dfc4881dc383b63685f9472f3af606026d173323259b6ce47cde4c757f77b5e3b420')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
