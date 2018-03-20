# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubelet-beta-bin
pkgdesc="Kubernetes.io kubelet binary (beta)"
pkgver=1.10.0.rc1
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
provides=('kubelet-bin')
conflicts=('kubernetes' 'kubelet-bin')
source_x86_64=(
  'https://packages.cloud.google.com/apt/pool/kubelet_1.9.5-00_amd64_5400807b4c667bfeaa5074245fb1edb20cf4b1b7f3ac88cb23df437f8558cd13.deb'
  'https://dl.k8s.io/v1.10.0-rc.1/kubernetes-node-linux-amd64.tar.gz'
)
sha256sums_x86_64=(
  '5400807b4c667bfeaa5074245fb1edb20cf4b1b7f3ac88cb23df437f8558cd13'
  'a3a3e27c2b77fa46b7c9ff3b8bfdc672c2657e47fc4b1ca3d76cdc102ca27630'
)

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  #install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
  install -D -m0755 "./kubernetes/node/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
