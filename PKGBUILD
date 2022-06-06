# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fmsb
_pkgver=0.7.3
pkgname=r-${_pkgname,,}
pkgver=0.7.3
pkgrel=3
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
sha256sums=('73d5a8da77381a3bce35a6edc86860d11711bb532e5fc77f4fd38705722729be')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
