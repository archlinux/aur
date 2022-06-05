# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigmemory.sri
_pkgver=0.1.3
pkgname=r-${_pkgname,,}
pkgver=0.1.3
pkgrel=4
pkgdesc='A shared resource interface for Bigmemory Project packages'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
)
optdepends=(
  r-bigmemory
  r-synchronicity
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('55403252d8bae9627476d1f553236ea5dc7aa6e54da6980526a6cdc66924e155')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
