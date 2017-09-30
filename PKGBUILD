# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.8.0
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes')
source_x86_64=(https://packages.cloud.google.com/apt/pool/kubelet_1.8.0-00_amd64_00b7c77c924d654c7def52c83cfeb9a3d1836c1e7b40683c3fe8207b0bd299d1.deb)
sha256sums_x86_64=('00b7c77c924d654c7def52c83cfeb9a3d1836c1e7b40683c3fe8207b0bd299d1')

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
