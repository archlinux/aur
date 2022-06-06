# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Dr.eg.db
_pkgver=3.15.0
pkgname=r-${_pkgname,,}
pkgver=3.15.0
pkgrel=3
pkgdesc='Genome wide annotation for Zebrafish'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
)
optdepends=(
  r-annotate
  r-dbi
  r-runit
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('96143b221a67d91c6c925647a1dfe323b0f5e8c32317c692e27a138d30e6af5a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
