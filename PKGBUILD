# system requirements: A 64-bit POSIX OS such as Linux or OS X with IANAtime zone data in /usr/share/zoneinfo as well as arecent-enough C++11 compiler (such as g++-4.9 or later which ispreferred, g++-4.8 works too). On Windows the zoneinfo includedwith R is used; and time parsing support is enabled via abackport of std::get_time from the LLVM libc++ library.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppCCTZ
_pkgver=0.2.12
pkgname=r-${_pkgname,,}
pkgver=0.2.12
pkgrel=1
pkgdesc="'Rcpp' Bindings for the 'CCTZ' Library"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2a2087bdb7ab4b617487b87677a81ccd0c5529f776cfe90d2e23d5f5478424cb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
