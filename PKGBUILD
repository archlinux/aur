# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowPeaks
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for flow data clustering"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-1.0-Perl')
depends=(
  gsl
  r
)
optdepends=(
  r-flowcore
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6d7c1f398f29c2171d16a70e0d3c3745')
b2sums=('6399940df4dac95962c3c67e19d44834cddd0baf3cd766df5109061128cdede9c6d9c6b1f6f40e23856f6cffdc28708a3756e767971e43054ed374a4680eaeeb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
