# Maintainer: colemickens <cole.mickens@gmail.com>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.10.0
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet-bin')
conflicts=('kubernetes')
source_x86_64=(
  'https://packages.cloud.google.com/apt/pool/kubeadm_1.10.0-00_amd64_ea6b408af5de27ae3df9a1f96724067104998608b64869fee2c680ea9f9c000d.deb'
)
sha256sums_x86_64=(
  'ea6b408af5de27ae3df9a1f96724067104998608b64869fee2c680ea9f9c000d'
)

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./etc/systemd/system/kubelet.service.d/10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "./usr/bin/kubeadm" "${pkgdir}/usr/bin/kubeadm"
}
