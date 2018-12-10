# Maintainer: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.13.0
pkgrel=0
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubelet')
sha256sums_x86_64=(
  'c1f5d00d11a393159bcacbc9182922a0d6f5a16385d2f947c38b5200dc5a6f07'
)
sha256sums_armv7l=(
  'ba5e091a1e004dbebd83ca5e6b65ca6e17e3a959141799218c264bc4e20d4473'
)
sha256sums_armv7h=(
  'ba5e091a1e004dbebd83ca5e6b65ca6e17e3a959141799218c264bc4e20d4473'
)
sha256sums_aarch64=(
  '3e7d7fcb80f27b5ff26bde3cea5d7130f14feb2a186dc92f61d0a2d19a05d957'
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
