#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspMachineLearning
_pkgver=0.17.2.1
pkgname=r-${_pkgname,,}
pkgver=0.17.2.1
pkgrel=1
pkgdesc=" Machine Learning Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-auc
  r-cluster
  r-colorspace
  r-dbscan
  r-e1071
  r-fpc
  r-gbm
  r-gmedian
  r-ggparty
  r-ggdendro
  r-ggnetwork
  r-ggplot2
  r-ggrepel
  r-ggridges
  r-glmnet
  r-jaspbase
  r-jaspgraphs
  r-neuralnet
  r-network
  r-partykit
  r-plyr
  r-randomforest
  r-rocr
  r-rtsne
  r-signal
  r-kknn
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('a2b23da6813e362cc5d81537d96bf1d6c32a7139bd9ec5f517cf29e9199b0982')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
