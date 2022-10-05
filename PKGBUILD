# system requirements: libgit2 (>= 0.26): libgit2-devel (rpm) orlibgit2-dev (deb)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gert
_pkgver=1.9.1
pkgname=r-${_pkgname,,}
pkgver=1.9.1
pkgrel=1
pkgdesc='Simple Git Client for R'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-askpass
  r-credentials
  r-openssl
  r-rstudioapi
  r-sys
  r-zip
  libgit2
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('751d18760a08ae00b8de73dc3e564cf4e76b1f47c7179101320e1b70152e1fdd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
