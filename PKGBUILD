# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowPeaks
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="An R package for flow data clustering"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-1.0-Perl')
depends=(
  gsl
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f68db373a0d053a7eabd112df80a25f1')
b2sums=('b1e0e5cea694f73ce830aa3e7f166f5dc17b2d5d2bf1cabb6a7ce6daf91884bdf087c1c998ab8dac340feee8471ed06df1eb14e793ef2d0923f3be33ea49a18c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
