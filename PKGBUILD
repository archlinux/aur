# Maintainer: Brad Erhart <brae.04+aur@gmail.com> 
pkgname=docker-machine-driver-kvm2
pkgver=0.34.1
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
sha256sums=('e15ba8584b8c46f914b9e2e4f9f333134f904e1f5c039dddb217e2a70f57fc02')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 $pkgname_$pkgver "$pkgdir/usr/bin/$pkgname"
}
