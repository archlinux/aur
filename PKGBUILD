# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=matter
_pkgver=2.6.1
pkgname=r-${_pkgname,,}
pkgver=2.6.1
pkgrel=1
pkgdesc='A framework for rapid prototyping with file-based data structures'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biglm
  r-biocgenerics
  r-biocparallel
  r-digest
  r-irlba
  r-protgenerics
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('76e485ca1cfe392621218bdd8288aff9f164eb2c8d9b5404b20515fa9bfcfc43')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
