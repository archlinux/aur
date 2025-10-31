# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBAmethyl
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Model-based analysis of DNA methylation data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cb80adc24dfaa9292a9c7c733e36ba02')
b2sums=('458a4bf0c39f895a1a4e5ae2db0af2819313262564db6b354499de9367f87d2e77a8432f2a7d64abf57102187a9b583dc5bb9097db0d2df8ba7a6c3b6a45773c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
