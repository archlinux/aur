# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.7.0
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes')
source_x86_64=(https://packages.cloud.google.com/apt/pool/kubeadm_1.7.0-00_amd64_6a9f69bdbc29c9f5c26729329225b9199e6927529516de2437ab8df1b92f9919.deb)
sha256sums_x86_64=('6a9f69bdbc29c9f5c26729329225b9199e6927529516de2437ab8df1b92f9919')

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./etc/systemd/system/kubelet.service.d/10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0644 "./usr/bin/kubeadm" "${pkgdir}/usr/bin/kubeadm"
}