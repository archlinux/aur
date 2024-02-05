# system requirements: OpenBugs for functions bugs() and openbugs() orWinBUGS 1.4 for function bugs()
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R2WinBUGS
_pkgver=2.1-22.1
pkgname=r-${_pkgname,,}
pkgver=2.1.22.1
pkgrel=1
pkgdesc="Running 'WinBUGS' and 'OpenBUGS' from 'R' / 'S-PLUS'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-coda
)
optdepends=(
  r-brugs
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('438e6241b96b73cf9adf51b5564fd27a14710256c93aa18e6b7382acc89d38a5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
