#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspLearnStats
_pkgver=0.95.3
pkgname=r-${_pkgname,,}
pkgver=0.95.3
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
sha256sums=('1d319b4fc15f7f647f916e5da2f2aac158edcde71b1eb19ecd531405452f8138')

build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
