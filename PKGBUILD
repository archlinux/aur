# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigmemory
_pkgver=4.6.1
pkgname=r-${_pkgname,,}
pkgver=4.6.1
pkgrel=4
pkgdesc='Manage Massive Matrices with Shared Memory and Memory-Mapped Files'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-bh
  r-bigmemory.sri
  r-rcpp
  r-uuid
)
optdepends=(
  r-biganalytics
  r-bigtabulate
  r-remotes
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b56e157c87ed6c4fc69d4cb9c697ae9a2001726e776e41aa7c48b35327b65141')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
