# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iASeq
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="integrating multiple sequencing datasets for detecting allele-specific events"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('46dab4e90f0ec409a636e27775ce87ad')
b2sums=('a6eecefd42a18f100642e7dc1558de1319c024fdd416c9be40f950e52d470101822f03d7fb405e478914c26bf547270dc7b2d7aeb8ace7076c54da048436c2dc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
