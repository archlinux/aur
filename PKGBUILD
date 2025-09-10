# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BatchJobs
_pkgver=1.10
pkgname=r-${_pkgname,,}
pkgver=1.10
pkgrel=1
pkgdesc='Batch Computing with R'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
  r-backports
  r-bbmisc
  r-brew
  r-checkmate
  r-data.table
  r-dbi
  r-digest
  r-rsqlite
  r-sendmailr
  r-stringi
)
optdepends=(
  r-mass
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1ecb3e0955d693d923a699579a7a751305e06188ca041735a1195cb7d0a2fef5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
