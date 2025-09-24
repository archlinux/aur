#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspMachineLearning
_pkgver=0.95.0
pkgname=r-${_pkgname,,}
pkgver=0.95.0
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
sha256sums=('eb95ceef6563e51a9f2dd336c65bd4c5bd41f17ca4da3a958c895c3e782594e4')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
