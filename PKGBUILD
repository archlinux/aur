# Maintainer: colemickens <cole.mickens@gmail.com>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.9.2
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet-bin')
conflicts=('kubernetes')
source_x86_64=(https://packages.cloud.google.com/apt/pool/kubeadm_1.9.2-00_amd64_869c826d406035aad1617118f88d5c627e16797388a5e2b3735d7b825d62e7ad.deb)
sha256sums_x86_64=('869c826d406035aad1617118f88d5c627e16797388a5e2b3735d7b825d62e7ad')

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./etc/systemd/system/kubelet.service.d/10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "./usr/bin/kubeadm" "${pkgdir}/usr/bin/kubeadm"
}
