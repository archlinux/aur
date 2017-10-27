# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.8.2
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes')
source_x86_64=(https://packages.cloud.google.com/apt/pool/kubelet_1.8.2-00_amd64_9646b1262ea4c99a89e94801b150e355a4e984c462bf8fb8a2fe9a33dacd74e0.deb)
sha256sums_x86_64=('9646b1262ea4c99a89e94801b150e355a4e984c462bf8fb8a2fe9a33dacd74e0')

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
