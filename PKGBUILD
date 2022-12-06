# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Giacomo Longo <gabibbo97@gmail.com>

pkgname=kubebuilder-bin
pkgver=3.8.0
pkgrel=1
pkgdesc="SDK for building Kubernetes APIs"
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('APACHE')
conflicts=('kubebuilder')
source_x86_64=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_amd64")
source_aarch64=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_arm64")
sha256sums_x86_64=('27d22a91e293c916012d60b66e42e72e7f0234fded7cc5c73eb28343cca7a869')
sha256sums_aarch64=('06d48bf9a580472c2b84771eb4a3b4d3b1583e880bf937339a1f04a3387abfe5')
arch=('x86_64' 'aarch64')

package() {
  if [ "$CARCH" = "aarch64" ]; then
    install -Dm755 "${srcdir}/kubebuilder_linux_arm64" "${pkgdir}/usr/bin/kubebuilder"
  else
    install -Dm755 "${srcdir}/kubebuilder_linux_amd64" "${pkgdir}/usr/bin/kubebuilder"
  fi
}
