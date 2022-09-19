# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dtw
_pkgver=1.23-1
pkgname=r-${_pkgname,,}
pkgver=1.23.1
pkgrel=1
pkgdesc='Dynamic Time Warping Algorithms'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-proxy
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6ed6a3b52be673ce2617b8d48723c7c488c95aab88fe2912d7e00507838e826d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
