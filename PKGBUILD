# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Dm.eg.db
_pkgver=3.15.0
pkgname=r-${_pkgname,,}
pkgver=3.15.0
pkgrel=3
pkgdesc='Genome wide annotation for Fly'
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
sha256sums=('734100d885e093ec4348d03c88d606abddef60fa9b4c03d5d0dc1edabb7e31b5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
