# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kriging
_pkgver=1.1
pkgname=r-${_pkgname,,}
pkgver=1.1
pkgrel=4
pkgdesc='Ordinary Kriging'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-maps
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bc20a08af3e6175836985cb0763cca20faf32f4190e6b779a656b8fcc8c87d11')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
