# Maintainer: navigaid <navigaid@gmail.com>

pkgname=kubelet-beta-bin
pkgdesc="Kubernetes.io kubelet binary (beta)"
pkgver=1.15.0_beta.1
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
provides=('kubelet-bin')
conflicts=('kubernetes' 'kubelet-bin')
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages
source_x86_64=(
  'https://packages.cloud.google.com/apt/pool/kubelet_1.14.2-00_amd64_6f10676ec9e3ae926be6eca3a2dbebe36b13b394a6d989932419e94ef3264694.deb'
  'https://dl.k8s.io/v1.15.0-beta.1/kubernetes-node-linux-amd64.tar.gz'
)
sha256sums_x86_64=(
  '6f10676ec9e3ae926be6eca3a2dbebe36b13b394a6d989932419e94ef3264694'
  'e396f056556a3156856502dfc8f7f7b2b6ea8d0320d26178a7cc9be045301d1c'
)

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  #install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
  install -D -m0755 "./kubernetes/node/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
