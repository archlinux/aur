# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=plgem
_pkgver=1.78.0
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
md5sums=('235a48662a4348b2cf87f14e593f06da')
b2sums=('65478ff39338a4dce7af2b762ef6cde67582a11771ab6eed86d35070ea1eaebf4c285908e669d8aeecb6c54e0788786cb421b6e9eb4e53af7c3efcc0a66a3a45')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
