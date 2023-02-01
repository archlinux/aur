#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspMachineLearning
_pkgver=0.17.0
pkgname=r-${_pkgname,,}
pkgver=0.17.0
pkgrel=6
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
sha256sums=('1caa0c385060fd13c90f6fe267559a1162bf6af89606ad610b8bd298363f02be')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
