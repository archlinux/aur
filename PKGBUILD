#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspMachineLearning
_pkgver=0.18.2
pkgname=r-${_pkgname,,}
pkgver=0.18.2
pkgrel=2
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
sha256sums=('a00f27a0341f0a347fe4fc846f74f32886f06545199b54cb1c99918113666d31')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
