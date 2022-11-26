# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gramm4R
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=6
pkgdesc='Generalized correlation analysis and model construction strategy for metabolome and microbiome'
arch=('any')
url="https://bioconductor.org/packages/3.14/${_pkgname}"
license=('GPL')
depends=(
  r
  r-basictrendline
  r-investr
  r-minerva
  r-psych
  r-delayedarray
  r-summarizedexperiment
  r-phyloseq
  r-dmwr
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

