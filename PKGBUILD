# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.7.0
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes')
source_x86_64=(https://packages.cloud.google.com/apt/pool/kubelet_1.7.0-00_amd64_b7c9be22a6379d8cc47ba1183bbc9de0acf49ad1418ffa8ae57628ad1d7c051f.deb)
sha256sums_x86_64=('b7c9be22a6379d8cc47ba1183bbc9de0acf49ad1418ffa8ae57628ad1d7c051f')

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}