# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.8.3
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes')
source_x86_64=(https://packages.cloud.google.com/apt/pool/kubelet_1.8.3-00_amd64_10bf853bba6b7713f8f3001f92612637ccee6893e699f7c41d91d2b4c3e6e25f.deb)
sha256sums_x86_64=('10bf853bba6b7713f8f3001f92612637ccee6893e699f7c41d91d2b4c3e6e25f')

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
