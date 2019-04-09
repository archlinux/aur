# Maintainer: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.14.1
pkgrel=0
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubelet')
sha256sums_x86_64=(
  '60ce697defdd990aee5e4b40abc7274f71e3aef6d9cc4feab240c8dc5681ed05'
)
sha256sums_armv7l=(
  '71907b6dfe6ad148ba073ddb19a5f5218b0c028500ad4c1092971b703680eef1'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '58dab728a2398d686547a18be1d49c7529a08f34c7ba85df142b4319aa1d30b0'
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
