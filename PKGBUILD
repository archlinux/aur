# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.7.5
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes')
source_x86_64=(https://packages.cloud.google.com/apt/pool/kubelet_1.7.5-00_amd64_0db3259738d749acca6ffff03ae4ccb87a4e6a64c3ac9884b34df7da936a3052.deb)
sha256sums_x86_64=('0db3259738d749acca6ffff03ae4ccb87a4e6a64c3ac9884b34df7da936a3052')

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
