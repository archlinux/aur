# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=marray
_pkgver=1.92.0
pkgname=r-${_pkgname,,}
pkgver=1.92.0
pkgrel=1
pkgdesc='Exploratory analysis for two-color spotted microarray data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-limma
)
optdepends=(
  r-tkwidgets
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0bb88fcb177723aacf311cb1c1e5e64e6147d8764cbbdd10481a44e7af8bda14')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
