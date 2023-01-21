# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NuPoP
_pkgver=2.6.3
pkgname=r-${_pkgname,,}
pkgver=2.6.3
pkgrel=1
pkgdesc='An R package for nucleosome positioning prediction'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
makedepends=(
  gcc-fortran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c4cf401698d396c5e9dec226fcbf9396fcc251fc98072a1ad3baf6f67a04b9f3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
