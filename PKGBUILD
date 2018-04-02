# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.10.0
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes')
source_x86_64=(
  'https://packages.cloud.google.com/apt/pool/kubelet_1.10.0-00_amd64_211eced3f0715db1dbbb9fa0973299a8f6b764ef43e25bd94fece3947b13091f.deb'
)
sha256sums_x86_64=(
  '211eced3f0715db1dbbb9fa0973299a8f6b764ef43e25bd94fece3947b13091f'
)

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
