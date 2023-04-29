# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=eiR
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=3
pkgdesc='Accelerated similarity searching of small molecules'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-chemminer
  r-dbi
  r-digest
  r-rcppannoy
  r-rcurl
  r-runit
  r-snow
  r-snowfall
)
optdepends=(
  r-biocstyle
  r-knitcitations
  r-knitr
  r-knitrbootstrap
  r-rmarkdown
  r-rsqlite
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('970bb76d91f87da2c3c983f9e5f4f62616df1fd8f50aa85afd38fbc88f6a2038')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
