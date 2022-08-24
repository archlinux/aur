# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HTSCluster
_pkgver=2.0.10
pkgname=r-${_pkgname,,}
pkgver=2.0.10
pkgrel=1
pkgdesc='Clustering High-Throughput Transcriptome Sequencing (HTS) Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-capushe
  r-edger
  r-plotrix
)
optdepends=(
  r-biobase
  r-htsfilter
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('36bdeea9074efa962622f6495f35442c51266a9e066ae856ec7fd2eab4239669')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
