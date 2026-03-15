#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspLearnStats
_pkgver=0.96.0
pkgname=r-${_pkgname,,}
pkgver=0.96.0
pkgrel=1
pkgdesc="Learn Classical statistics with simple examples and supporting text"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL-2.0-or-later')
depends=(r
  r-extradistr
  r-ggplot2
  r-jaspbase
  r-jaspgraphs
  r-jaspdistributions
  r-jaspdescriptives
  r-jaspttests
  r-ggforce
  r-tidyr
  r-igraph
  r-hdinterval
  r-metafor
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('77a92b031ff17f938978267c09393a972d710cf5f4f7ef00e33e4d325e73de80')

build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
