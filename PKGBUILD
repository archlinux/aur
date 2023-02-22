# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lokern
_pkgver=1.1-10
pkgname=r-${_pkgname,,}
pkgver=1.1.10
pkgrel=1
pkgdesc='Kernel Regression Smoothing with Local or Global Plug-in Bandwidth'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-sfsmisc
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('00bc823c6c377c4d7d23218254b7e45c2f606a9e74e21d985aeb6382ffddf992')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
