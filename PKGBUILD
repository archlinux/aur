# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNORode
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='ODE add-on to CellNOptR'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cellnoptr
  r-genalg
  r-knitr
)
optdepends=(
  r-doparallel
  r-foreach
  r-meigor
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('876e053a8d3510a7be608c206c1ca2be789784539072aa25e4d05bb17785bd36')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
