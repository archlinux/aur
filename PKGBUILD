# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clonotypeR
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='High throughput analysis of T cell antigen receptor sequences'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-edger
  r-knitr
  r-pvclust
  r-rmarkdown
  r-runit
  r-vegan
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d83cf13658ec2119cfddf4b4d88cdd74843a823bba57dd83a596ad219891d696')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
