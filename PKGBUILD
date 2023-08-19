# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiasedUrn
_pkgver=2.0.11
pkgname=r-${_pkgname,,}
pkgver=2.0.11
pkgrel=1
pkgdesc='Biased Urn Model Distributions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6295f1a12cd9d425cc03ec05a993fba04f539007c1754f23d7043a585b9e7537')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
