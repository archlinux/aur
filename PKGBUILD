# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SRGnet
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=4
pkgdesc='An R package for studying synergistic response to gene mutations from transcriptomics data'
arch=('any')
url="https://bioconductor.org/packages/3.12/bioc/html/SRGnet.html"
license=('GPL')
depends=(
  r
  r-dmwr
  r-ebcoexpress
  r-gbm
  r-hmisc
  r-igraph
  r-limma
  r-matrixstats
  r-pvclust
)
makedepends=(
  git
  tar
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("git+https://git.bioconductor.org/packages/${_pkgname}.git")
sha256sums=('SKIP')

build() {
  tar -zcvf ${_pkgname}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

