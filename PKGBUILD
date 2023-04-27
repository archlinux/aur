# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timecourse
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=1.72.0
pkgrel=1
pkgdesc='Statistical Analysis for Developmental Microarray Time Course Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-limma
  r-marray
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1a06d6b0cdf8cbe1440c57d39dd138b2d26c0ecdfff9be5a5ff50a197ea7cece')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
