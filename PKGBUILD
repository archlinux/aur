# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=survcomp
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=1
pkgdesc='Performance Assessment and Comparison for Survival Analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bootstrap
  r-ipred
  r-prodlim
  r-rmeta
  r-suppdists
  r-survivalroc
)
optdepends=(
  r-biobase
  r-biocmanager
  r-clinfun
  r-hmisc
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('46b695a81ab95c6423f2148f813c384615fb2977cf53a73e94794c3cba8c40ed')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
