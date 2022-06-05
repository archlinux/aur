# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affxparser
_pkgver=1.68.1
pkgname=r-${_pkgname,,}
pkgver=1.68.1
pkgrel=1
pkgdesc='Affymetrix File Parsing SDK'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  make
  gcc
)
optdepends=(
  r-affymetrixdatatestfiles
  r-r.oo
  r-r.utils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9a462b6dc5c3592b32cdc06afc4cc3d50bdb0f419c9156c9f7ed1faff913a99b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}" || bash -c "ls /usr/include/fusion && ls fusion/calvin_files/data/src/"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
