# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NLP
_pkgver=0.3-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Natural Language Processing Infrastructure"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ef20c55ef50dedbf07c6fc441ad2d8f9')
b2sums=('f09750e5afe10e405ea4fef42c7ab57f0fc11a3553045b369bd120a1bdd3fae7b511ea0bea84bb65bddcd54adc1d0a1646935ce1ea979a5d71bd5be7fb35a64e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
