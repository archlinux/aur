# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggseqlogo
_pkgver=0.1
pkgname=r-${_pkgname,,}
pkgver=0.1
pkgrel=4
pkgdesc="A 'ggplot2' Extension for Drawing Publication-Ready Sequence Logos"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-ggplot2
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c14f145a982597f32264b37a5f2645206a0bee30dd2584a25cb8e3dc2f9b068f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
