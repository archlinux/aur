# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seq2pathway.data
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="data set for R package seq2pathway"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e10e7d6d29df7426202eaee643e8a80f')
b2sums=('9be121f0a239b4cababbd862229b2a50c4ec405750bd4b758468b7143d769a141b3905b03a209c7746ae1bf8aa990c7d7be647e469c923caa91f4e1182defc43')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
