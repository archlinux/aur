# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.9.1
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes')
source_x86_64=(https://packages.cloud.google.com/apt/pool/kubelet_1.9.0-00_amd64_31ec5709ec1eb37b194563cb28eaafafd1f0c9d009239cdfb694686066b35c2e.deb)
sha256sums_x86_64=('31ec5709ec1eb37b194563cb28eaafafd1f0c9d009239cdfb694686066b35c2e')

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
