# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DriverNet
_pkgver=1.52.0
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
md5sums=('8b42e31704b98e51495c93eab3b140db')
b2sums=('a69ae079e81eb386696f182c13b49fc89d21ce513893bc36776cb5f9e6468721734c4b9e63a7c7fda4c6212733fc03d596aa243c4dd0eea04cedcf07bc9f6ab3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
