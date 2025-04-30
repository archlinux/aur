# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=hierfstat
_pkgver=0.5-11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=2
pkgdesc='Estimation and Tests of Hierarchical F-Statistics'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  r-ade4
  r-adegenet
  r-gaston
  r-gtools
)
optdepends=(
  r-ape
  r-knitr
  r-pegas
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9bc78ee3f9bbe0fe2ab9e44c5bff40cf')
b2sums=('86444e7553413f28d934882a57e49c78e16da50108b3663f13c18642ae66268a6cef1042f4cbb979f6b5d39472f48d8b68c625b7984358c9a6bcfebac8d2d729')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
