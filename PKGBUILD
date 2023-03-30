# system requirements: libcurl: libcurl-devel (rpm) orlibcurl4-openssl-dev (deb)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=strawr
_pkgver=0.0.91
pkgname=r-${_pkgname,,}
pkgver=0.0.91
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
sha256sums=('55e06f35613b8cef8405498393e15591c06281004332ad532f6eb8f180b06cd9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
