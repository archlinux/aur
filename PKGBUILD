# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubelet-beta-bin
pkgdesc="Kubernetes.io kubelet binary (beta)"
pkgver=1.10.0.beta3
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
provides=('kubelet-bin')
conflicts=('kubernetes' 'kubelet-bin')
source_x86_64=(
  'https://packages.cloud.google.com/apt/pool/kubelet_1.9.4-00_amd64_c8c2af29e421adf188c94b7049e30ed1b6368dad49cfe5e8c865d43a16be6b76.deb'
  'https://dl.k8s.io/v1.10.0-beta.3/kubernetes-node-linux-amd64.tar.gz'
)
sha256sums_x86_64=(
  'c8c2af29e421adf188c94b7049e30ed1b6368dad49cfe5e8c865d43a16be6b76'
  'e517986261e3789cada07d9063ae96ed9b17ffd80c1b220b6ae9c41238c07c08'
)

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  #install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
  install -D -m0755 "./kubernetes/node/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
