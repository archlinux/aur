# Maintainer: Brad Erhart <brae.04+aur@gmail.com> 
pkgname=docker-machine-driver-kvm2
pkgver=1.1.0
pkgrel=2
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
sha256sums=('98fd0d9947da473667adcb2e0615f95eb781e31e4870a4b4eea29aa15cce3b11')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 $pkgname_$pkgver "$pkgdir/usr/bin/$pkgname"
}
