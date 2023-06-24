# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gcatest
_pkgver=2.0.7
pkgname=r-${_pkgname,,}
pkgver=2.0.7
pkgrel=1
pkgdesc='Genotype Conditional Association TEST'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-lfa
)
optdepends=(
  r-ggplot2
  r-knitr
)
makedepends=('git')
source=("git+https://git.bioconductor.org/packages/${_pkgname}")
sha256sums=('SKIP')

prepare(){
  tar -czf ${_pkgname}_$_pkgver.tar.gz ${_pkgname}
}

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
