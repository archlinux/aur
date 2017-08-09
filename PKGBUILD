# Maintainer: colemickens <cole.mickens@gmail.com>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.7.3
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes')
source_x86_64=(https://packages.cloud.google.com/apt/pool/kubeadm_1.7.3-01_amd64_c4bac3fcbc1a820523a3617495707aff0adab0db52ae02f3a5ee5001ff0a1e74.deb)
sha256sums_x86_64=('c4bac3fcbc1a820523a3617495707aff0adab0db52ae02f3a5ee5001ff0a1e74')

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./etc/systemd/system/kubelet.service.d/10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "./usr/bin/kubeadm" "${pkgdir}/usr/bin/kubeadm"
}
