# Maintainer: Brad Erhart <brae.04+aur@gmail.com> 
pkgname=docker-machine-driver-kvm2
pkgver=1.0.1
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
sha256sums=('062e0d6a3d57e2f4572db47d6874e9efb6fc2bf57d86592ec7e6ee0cce0fd916')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 $pkgname_$pkgver "$pkgdir/usr/bin/$pkgname"
}
