# Maintainer: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.13.3
pkgrel=0
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubelet')
sha256sums_x86_64=(
  '48d32f5aa84b897343500c9d2a4d283e46e230e7916902dffa2cdad34efd9b1b'
)
sha256sums_armv7l=(
  'a69394e3535ba885ee8ce872634a1efec0b83181264a842280bd76bebf9c5f2e'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '7c5e14b33cf4cc6f60f68d00ada4086b838a0a780ccebd27e148c1d886f2a44b'
)
source_x86_64=(
  "https://packages.cloud.google.com/apt/pool/kubelet_${pkgver}-00_amd64_${sha256sums_x86_64}.deb"
)
source_armv7l=(
  "https://packages.cloud.google.com/apt/pool/kubelet_${pkgver}-00_armhf_${sha256sums_armv7l}.deb"
)
source_armv7h=(
  "https://packages.cloud.google.com/apt/pool/kubelet_${pkgver}-00_armhf_${sha256sums_armv7h}.deb"
)
source_aarch64=(
  "https://packages.cloud.google.com/apt/pool/kubelet_${pkgver}-00_arm64_${sha256sums_aarch64}.deb"
)

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
