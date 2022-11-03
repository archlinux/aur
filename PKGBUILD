# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Hs.eg.db
_pkgver=3.16.0
pkgname=r-${_pkgname,,}
pkgver=3.16.0
pkgrel=1
pkgdesc='Genome wide annotation for Human'
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
sha256sums=('2d2e6fdefa0dbb61c86d4736e5a0d430745ae733e310f240b97b2cb3703a2c0a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
