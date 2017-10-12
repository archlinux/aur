# Maintainer: colemickens <cole.mickens@gmail.com>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.8.1
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet-bin')
conflicts=('kubernetes')
source_x86_64=(https://packages.cloud.google.com/apt/pool/kubeadm_1.8.1-01_amd64_5863420bee513756daf8cd08af801c5420397409191df19535d8c618a100989c.deb)
sha256sums_x86_64=('5863420bee513756daf8cd08af801c5420397409191df19535d8c618a100989c')

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./etc/systemd/system/kubelet.service.d/10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "./usr/bin/kubeadm" "${pkgdir}/usr/bin/kubeadm"
}
