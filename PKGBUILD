# Maintainer: Wes Jackson <icebal dot 7 at gmail dot com>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.12.2
pkgrel=2
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet-bin')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubeadm')
sha256sums_x86_64=(
  '777b8af5ad6ffb59d0ad4e6ea08061ae9714c3c86f11b31c945058d48ec98a44'
)
sha256sums_armv7l=(
  '51f72a60b1d59b9fbcaa5f3cade0dd5d4fbc6edd6d53ceddb41e2baac665d13c'
)
sha256sums_armv7h=(
  '51f72a60b1d59b9fbcaa5f3cade0dd5d4fbc6edd6d53ceddb41e2baac665d13c'
)
sha256sums_aarch64=(
  'af0d30160cdc07eac5fe2f7affd5b254d18657bd4d6e1bd256f0a2b26319c11a'
)
source_x86_64=(
  "https://packages.cloud.google.com/apt/pool/kubeadm_${pkgver}-00_amd64_${sha256sums_x86_64}.deb"
)
source_armv7l=(
  "https://packages.cloud.google.com/apt/pool/kubeadm_${pkgver}-00_armhf_${sha256sums_armv7l}.deb"
)
source_armv7h=(
  "https://packages.cloud.google.com/apt/pool/kubeadm_${pkgver}-00_armhf_${sha256sums_armv7h}.deb"
)
source_aarch64=(
  "https://packages.cloud.google.com/apt/pool/kubeadm_${pkgver}-00_arm64_${sha256sums_aarch64}.deb"
)
package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./etc/systemd/system/kubelet.service.d/10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "./usr/bin/kubeadm" "${pkgdir}/usr/bin/kubeadm"
}
