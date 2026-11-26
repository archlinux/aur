# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LungCancerACvsSCCGEO
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A lung cancer dataset that can be used with maPredictDSC package for developing outcome prediction models from Affymetrix CEL files"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d11f7373e341c37ffb7a2411ed15f4a5')
b2sums=('df82775551a97226e985a5bb23fdd04dfeb16e79b4c03dad399dc74781c6d77a1575512d51ad0ff6149ef3daf252f6d81efc255679559b0029e50b3504c93b29')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
