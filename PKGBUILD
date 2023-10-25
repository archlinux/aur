# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gcspikelite
_pkgver=1.39.0
pkgname=r-${_pkgname,,}
pkgver=1.39.0
pkgrel=1
pkgdesc='Spike-in data for GC/MS data and methods within flagme'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c9d3ac30901b33e3b2ec2e94eefc0c20a9840a39df8d49e3cff25c44cf459883')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
