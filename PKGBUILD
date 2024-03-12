# Maintainer: Justin Hung <hugh.12345zxcvb@gmail.com>

pkgname=kube-capacity-bin
_pkgname=kube-capacity-bin
pkgver=v0.8.0
pkgrel=0
pkgdesc="A simple CLI that provides an overview of the resource requests, limits, and utilization in a Kubernetes cluster"
arch=('x86_64' 'arm64' 'i386')
url="https://github.com/robscott/kube-capacity"

source_x86_64=("https://github.com/robscott/kube-capacity/releases/download/$pkgver/kube-capacity_"$pkgver"_linux_x86_64.tar.gz")
source_arm64=("https://github.com/robscott/kube-capacity/releases/download/$pkgver/kube-capacity_"$pkgver"_linux_arm64.tar.gz")
source_i386=("https://github.com/robscott/kube-capacity/releases/download/$pkgver/kube-capacity_"$pkgver"_linux_i386.tar.gz")

sha256sums_x86_64=('610ce6e5d7f528df1c60d3b5e277d00ac43cdfd9ce4d36f0b3132bb68fc12cf3')
sha256sums_arm64=('ef4ba0c43b57d6efc0472ce465f69a6102bdeeb16541120ea1a510a2d2f98465')
sha256sums_i386=('22b018ce72d46fff2f00acd45080d9b9bb08aee1be3f5b67fd72607cc87494d9')

options=(!strip)
license=('Apache-2.0')

package() {
  install -Dm 755 "$srcdir/kube-capacity" "$pkgdir/usr/bin/kube-capacity"
}

check() {
  kube-capacity version
}