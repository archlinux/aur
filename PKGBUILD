# Maintainer: Brad Erhart <brae.04+aur@gmail.com> 

pkgname=docker-machine-driver-kvm2
pkgver=1.3.0
pkgrel=1
pkgdesc="Minikube-maintained KVM driver for docker-machine"
url="https://github.com/kubernetes/minikube"
license=('Apache')
arch=('x86_64')
depends=(
  'docker-machine'
  'libvirt'
  'iptables'
  'dnsmasq'
)
optdepends=(
  'docker: to manage the containers in the machine'
)
makedepends=()

source=($pkgname_$pkgver::https://github.com/kubernetes/minikube/releases/download/v$pkgver/$pkgname)
sha256sums=('30cc73595f9e2d57309b55f357b71ee162dc0347b2797a965cab0fdf23b42e75')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 $pkgname_$pkgver "$pkgdir/usr/bin/$pkgname"
}
