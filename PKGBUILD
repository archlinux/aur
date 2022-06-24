# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Giacomo Longo <gabibbo97@gmail.com>

pkgname=kubebuilder-bin
pkgver=3.5.0
pkgrel=1
pkgdesc="SDK for building Kubernetes APIs"
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('APACHE')
conflicts=('kubebuilder')
source_x86_64=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_amd64")
source_aarch64=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_arm64")
sha256sums_x86_64=('271e59de861684156515b8aa53eafa0cd242017595652c52a072b1812bbd3775')
sha256sums_aarch64=('6c7a8238138b309d2fb84f316f800da804ece829c67304ead144a0291f282f1a')
arch=('x86_64' 'aarch64')

package() {
  if [ "$CARCH" = "aarch64" ]; then
    install -Dm755 "${srcdir}/kubebuilder_linux_arm64" "${pkgdir}/usr/bin/kubebuilder"
  else
    install -Dm755 "${srcdir}/kubebuilder_linux_amd64" "${pkgdir}/usr/bin/kubebuilder"
  fi
}
