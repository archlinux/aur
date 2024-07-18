# system requirements: libcurl: libcurl-devel (rpm) orlibcurl4-openssl-dev (deb)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=strawr
_pkgver=0.0.92
pkgname=r-${_pkgname,,}
pkgver=0.0.92
pkgrel=1
pkgdesc='Fast Implementation of Reading/Dump for .hic Files'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fa08b5765a92a75d1fa003cd881daa2ccff129f2cda6b569ae5cd7cd9fbac637')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
