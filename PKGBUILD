# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=faahKO
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc='Saghatelian et al. (2004) FAAH knockout LC/MS data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-xcms
)
optdepends=(
  r-msnbase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c356df65faf1c49a2f0785091f18c24096aa58d251b28a38eb211075ab2a7f89')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
