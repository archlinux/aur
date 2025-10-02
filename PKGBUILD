#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspAcceptanceSampling
_pkgver=0.95.3
pkgname=r-${_pkgname,,}
pkgver=0.95.3
pkgrel=1
pkgdesc="Lot sampling for acceptance/rejection of lots"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-abtest
  r-bayesfactor
  r-conting
  r-ggplot2
  r-jaspbase
  r-jaspgraphs
  r-plyr
  r-stringr
  r-vcd
  r-vcdextra
  r-acceptancesampling
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('a8be23c71464ff09ca6f6ba778336a03f165226f5882e0950fffa4e28225dd83')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
