# Maintainer: colemickens <cole.mickens@gmail.com>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.12.1
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet-bin')
conflicts=('kubernetes')
source_x86_64=(
  'https://packages.cloud.google.com/apt/pool/kubeadm_1.12.1-00_amd64_3caa0392444658082aa459418728abf81e440f439960963f54f08c6e6fdefbd3.deb'
)
source_armv7l=(
  'https://packages.cloud.google.com/apt/pool/kubeadm_1.12.1-00_armhf_9e791661bd57d71385255e0b985223799239e82aea4350c3ac22f992e86ea44e.deb'
)
source_armv7h=(
  'https://packages.cloud.google.com/apt/pool/kubeadm_1.12.1-00_armhf_9e791661bd57d71385255e0b985223799239e82aea4350c3ac22f992e86ea44e.deb'
)
source_aarch64=(
  'https://packages.cloud.google.com/apt/pool/kubeadm_1.12.1-00_arm64_ce3d4358838b5499e0eedd4880ee31ddd8bb3d9e8a4a4c5c68dfb6b47747c9c0.deb'
)
sha256sums_x86_64=(
  '3caa0392444658082aa459418728abf81e440f439960963f54f08c6e6fdefbd3'
)
sha256sums_armv7l=(
  '9e791661bd57d71385255e0b985223799239e82aea4350c3ac22f992e86ea44e'
)
sha256sums_armv7h=(
  '9e791661bd57d71385255e0b985223799239e82aea4350c3ac22f992e86ea44e'
)
sha256sums_aarch64=(
  'ce3d4358838b5499e0eedd4880ee31ddd8bb3d9e8a4a4c5c68dfb6b47747c9c0'
)
package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./etc/systemd/system/kubelet.service.d/10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "./usr/bin/kubeadm" "${pkgdir}/usr/bin/kubeadm"
}
