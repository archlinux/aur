# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=comprehenr
_pkgver=0.6.10
pkgname=r-${_pkgname,,}
pkgver=0.6.10
pkgrel=2
pkgdesc='List Comprehensions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5c08efe824278b086a9f45823b2239206b3190e463c607d3ebb690cab5018cf2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
