# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiasedUrn
_pkgver=1.07
pkgname=r-${_pkgname,,}
pkgver=1.07
pkgrel=4
pkgdesc='Biased Urn Model Distributions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2377c2e59d68e758a566452d7e07e88663ae61a182b9ee455d8b4269dda3228e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
