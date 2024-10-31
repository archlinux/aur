# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=parglms
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='support for parallelized estimation of GLMs/GEEs'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-batchjobs
  r-biocgenerics
  r-doparallel
  r-foreach
)
optdepends=(
  r-biocstyle
  r-genomeinfodb
  r-genomicranges
  r-gwascat
  r-knitr
  r-mass
  r-rmarkdown
  r-runit
  r-sandwich
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('962cc747eed761b4aa62250ccd83958c89114354532f147bfe44c14cda72b9be')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
