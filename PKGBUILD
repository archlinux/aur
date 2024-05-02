# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DriverNet
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="uncovering somatic driver mutations modulating transcriptional networks in cancer"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e81deabff3fc7efa7340c7b51534b900')
b2sums=('f047f54e3b84815decd2d826802b67dd3b2765e87cd9a062477a48b7f3fa80fcaf1f144d11c3e135d10c8bd1311375639f8e402b863e1d87795f63902f34b426')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
