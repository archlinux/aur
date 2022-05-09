# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Giacomo Longo <gabibbo97@gmail.com>

pkgname=kubebuilder-bin
pkgver=3.4.1
pkgrel=2
pkgdesc="SDK for building Kubernetes APIs"
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('APACHE')
conflicts=('kubebuilder')
source_x86_64=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_amd64")
source_aarch64=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_arm64")
sha256sums_x86_64=('4b9c6b3afec09bd1c1f1a67ed11c275854b9cbddc1654ebdb77c3b0b95f4e065')
sha256sums_aarch64=('802aaa112d9890d30744e20058b7fff0d6a8741ee37804855e7191dd494c9e74')
arch=('x86_64' 'aarch64')

package() {
  if [ "$CARCH" = "aarch64" ]; then
    install -Dm755 "${srcdir}/kubebuilder_linux_arm64" "${pkgdir}/usr/bin/kubebuilder"
  else
    install -Dm755 "${srcdir}/kubebuilder_linux_amd64" "${pkgdir}/usr/bin/kubebuilder"
  fi
}
