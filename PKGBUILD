# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.9.2
pkgrel=2
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes')
source_x86_64=(https://packages.cloud.google.com/apt/pool/kubelet_1.9.2-00_amd64_cdb2335fec48cd8cb3ad2bdd874fb29828ceb893d200ebee44657ae51f0851b4.deb)
sha256sums_x86_64=('cdb2335fec48cd8cb3ad2bdd874fb29828ceb893d200ebee44657ae51f0851b4')

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
