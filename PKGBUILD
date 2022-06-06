# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NuPoP
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=2.4.0
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
sha256sums=('df6dcc7ef148e0d148fac8f7387f8c67810e11916e50fa997d32ab1e26b6aa3f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
