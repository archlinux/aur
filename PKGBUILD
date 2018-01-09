# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.9.1
pkgrel=2
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes')
source_x86_64=(https://packages.cloud.google.com/apt/pool/kubelet_1.9.1-00_amd64_e1111bdd0cb45976216b7498a0b1d68d15ddaacc462a067d831b0f20ae8c276b.deb)
sha256sums_x86_64=('e1111bdd0cb45976216b7498a0b1d68d15ddaacc462a067d831b0f20ae8c276b')

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
