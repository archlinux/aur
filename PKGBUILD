# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.12.1
pkgrel=3
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubelet')
source_x86_64=(
  'https://packages.cloud.google.com/apt/pool/kubelet_1.12.1-00_amd64_ae75f76207874c43f7e20e8184265e6a9fe38ef0c93e61115362280227bed23f.deb'
)
source_armv7l=(
  'https://packages.cloud.google.com/apt/pool/kubelet_1.12.1-00_armhf_3cff3f2835af58883673a5f9d1f0bfa36856b607449bfd747e2038c619915780.deb'
)
source_armv7h=(
  'https://packages.cloud.google.com/apt/pool/kubelet_1.12.1-00_armhf_3cff3f2835af58883673a5f9d1f0bfa36856b607449bfd747e2038c619915780.deb'
)
source_aarch64=(
  'https://packages.cloud.google.com/apt/pool/kubelet_1.12.1-00_arm64_514170cb05c2ecda1e086c21660b65d22cdb6975fe4240503c6a0e02d6bbcde7.deb'
)
sha256sums_x86_64=(
  '62015ea9af675de7f785081d518110d4df18580ddf9d382d2616e389a196f3da'
)
sha256sums_armv7l=(
  '3cff3f2835af58883673a5f9d1f0bfa36856b607449bfd747e2038c619915780'
)
sha256sums_armv7h=(
  '3cff3f2835af58883673a5f9d1f0bfa36856b607449bfd747e2038c619915780'
)
sha256sums_aarch64=(
  '479b88b22a5a7dcc20c2befe1d21e7a1e83c2d475c3066c6ea544b93d8eb5dfd'
)

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
