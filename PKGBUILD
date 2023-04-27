# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FilterFFPE
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='FFPE Artificial Chimeric Read Filter for NGS data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-doparallel
  r-foreach
  r-genomicranges
  r-iranges
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7c66595417f87bc9ed88ec901f833cfa8320c92e6e061f80ca8fb83ec21b08b4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
