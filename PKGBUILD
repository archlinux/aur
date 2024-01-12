#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspMachineLearning
_pkgver=0.18.3
pkgname=r-${_pkgname,,}
pkgver=0.18.3
pkgrel=1
pkgdesc=" Machine Learning Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-auc
  r-cluster
  r-colorspace
  r-dalex
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
  r-mvnormaltest
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
sha256sums=('5bcb3c73ea12bc17874bd3479b6189b70dbd6b1e950b7c5bb3b42847ccbb6e50')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
