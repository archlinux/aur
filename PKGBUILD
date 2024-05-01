# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MOGAMUN
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='MOGAMUN: A Multi-Objective Genetic Algorithm to Find Active Modules in Multiplex Biological Networks'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-igraph
  r-rcy3
  r-runit
  r-stringr
)
optdepends=(
  r-knitr
  r-markdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('68ae773587b902a6a437a16e0ca253c9a05e619c97b3e54e09f70e95905dd750')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
