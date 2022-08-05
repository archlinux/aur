# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Giacomo Longo <gabibbo97@gmail.com>

pkgname=kubebuilder-bin
pkgver=3.6.0
pkgrel=1
pkgdesc="SDK for building Kubernetes APIs"
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('APACHE')
conflicts=('kubebuilder')
source_x86_64=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_amd64")
source_aarch64=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_arm64")
sha256sums_x86_64=('d5a9f639cb98298817bcab32b6046eb45cb912b56217a75d729646512a436ff4')
sha256sums_aarch64=('15e1cdf90ffcfefbd81aac0f620f8239f13902e80592e1239733e5ba607a5ec7')
arch=('x86_64' 'aarch64')

package() {
  if [ "$CARCH" = "aarch64" ]; then
    install -Dm755 "${srcdir}/kubebuilder_linux_arm64" "${pkgdir}/usr/bin/kubebuilder"
  else
    install -Dm755 "${srcdir}/kubebuilder_linux_amd64" "${pkgdir}/usr/bin/kubebuilder"
  fi
}
