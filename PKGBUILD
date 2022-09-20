# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Giacomo Longo <gabibbo97@gmail.com>

pkgname=kubebuilder-bin
pkgver=3.7.0
pkgrel=1
pkgdesc="SDK for building Kubernetes APIs"
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('APACHE')
conflicts=('kubebuilder')
source_x86_64=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_amd64")
source_aarch64=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_arm64")
sha256sums_x86_64=('b413f3229a27d83bdfe525c20144e8bab5c15fc8771717c41d8fb9fd68898dd8')
sha256sums_aarch64=('2f6f57d100ae9c89edf250043f0b883a6debbac0688868bacd4979dc9b8d4d0b')
arch=('x86_64' 'aarch64')

package() {
  if [ "$CARCH" = "aarch64" ]; then
    install -Dm755 "${srcdir}/kubebuilder_linux_arm64" "${pkgdir}/usr/bin/kubebuilder"
  else
    install -Dm755 "${srcdir}/kubebuilder_linux_amd64" "${pkgdir}/usr/bin/kubebuilder"
  fi
}
