# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fmsb
_pkgver=0.7.5
pkgname=r-${_pkgname,,}
pkgver=0.7.5
pkgrel=1
pkgdesc='Functions for Medical Statistics Book with some Demographic Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-epi
  r-vcd
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3e17dbcb3f7ddb1ab624029bfe60f9d1f4d6fba01a60ce94dcfcfb3f11905820')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
