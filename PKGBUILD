# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Bt.eg.db
_pkgver=3.16.0
pkgname=r-${_pkgname,,}
pkgver=3.16.0
pkgrel=1
pkgdesc='Genome wide annotation for Bovine'
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
sha256sums=('9ab5c965fa59fae6b791675a2c9b25368644eac2748e6c80243ad015b0f4558b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
