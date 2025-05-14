# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=faahKO
_pkgver=1.48.1
pkgname=r-${_pkgname,,}
pkgver=1.48.1
pkgrel=1
pkgdesc='Saghatelian et al. (2004) FAAH knockout LC/MS data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-xcms
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('000402158c54bd8044d7a10cc6726eaed0d2e9809adfec5a6ed3ef7e06aa9e38')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
