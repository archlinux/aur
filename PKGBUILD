# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiasedUrn
_pkgver=2.0.8
pkgname=r-${_pkgname,,}
pkgver=2.0.8
pkgrel=1
pkgdesc='Biased Urn Model Distributions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('205e7f8da8fba76fbf4bd9d12a027599b685dedecc818aad39de5c51dc47b856')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
