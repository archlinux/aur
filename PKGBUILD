# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=downloader
_pkgver=0.4
pkgname=r-${_pkgname,,}
pkgver=0.4
pkgrel=4
pkgdesc='Download Files over HTTP and HTTPS'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-digest
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1890e75b028775154023f2135cafb3e3eed0fe908138ab4f7eff1fc1b47dafab')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
