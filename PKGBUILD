# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.9.4
pkgrel=3
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes')
source_x86_64=(https://packages.cloud.google.com/apt/pool/kubelet_1.9.4-00_amd64_c8c2af29e421adf188c94b7049e30ed1b6368dad49cfe5e8c865d43a16be6b76.deb)
sha256sums_x86_64=('c8c2af29e421adf188c94b7049e30ed1b6368dad49cfe5e8c865d43a16be6b76')

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
