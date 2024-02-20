# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiasedUrn
_pkgver=2.0.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Biased Urn Model Distributions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('435d436db9c8359cf99234f9468bfc78')
b2sums=('9351d7487088136a2edf64b54486cfe03d79a27807013c3be391bcaf6e293cc1c6c8e1ac2932a3dc54c8874387423d25c8d522e40f1911a63248c17e8d79b136')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
