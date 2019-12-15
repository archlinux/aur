# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubernetes-cni-bin
pkgdesc="Kubernetes.io kubernetes-cni binary"
pkgver=0.7.5
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes')
source_x86_64=(https://packages.cloud.google.com/apt/pool/kubernetes-cni_0.7.5-00_amd64_b38a324bb34f923d353203adf0e048f3b911f49fa32f1d82051a71ecfe2cd184.deb)
sha256sums_x86_64=('b38a324bb34f923d353203adf0e048f3b911f49fa32f1d82051a71ecfe2cd184')

package() {
  tar -vxf data.tar.xz
  install -D -d -m0755 "./opt/cni/bin" "${pkgdir}/opt/cni/bin"

  for file in ./opt/cni/bin/*; do
      install -m0755 "$file" "${pkgdir}/opt/cni/bin/"
  done
}
