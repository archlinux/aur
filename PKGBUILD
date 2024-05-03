# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methInheritSim
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Simulating Whole-Genome Inherited Bisulphite Sequencing Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-methylkit
  r-msm
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-knitr
  r-methylinheritance
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('76a4f7c1c472fb0cb660a12c4103dfc4168586f4d1f78c689e3a2aa0f0d22431')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
