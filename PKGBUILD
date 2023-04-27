# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affxparser
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=1.72.0
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
sha256sums=('1e7505b6cdd510d1a749bb9d37f33701d4527dd13f4e606c3f6ff8bf86af0659')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}" || bash -c "ls /usr/include/fusion && ls fusion/calvin_files/data/src/"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
