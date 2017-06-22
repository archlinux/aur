# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Matt Rickard <mrick@google.com> 

pkgname=minikube
pkgver=0.20.0
pkgrel=1
pkgdesc="Minikube is a tool that makes it easy to run Kubernetes locally"
url="https://github.com/kubernetes/minikube"
license=('Apache')
arch=('x86_64')
depends=(
  'net-tools'
)
optdepends=(
  'kubectl-bin: to manage the cluster'
  'virtualbox'
  'docker-machine-kvm'
)
makedepends=()

source=(minikube_$pkgver::https://storage.googleapis.com/minikube/releases/v$pkgver/minikube-linux-amd64)
sha256sums=('f7d51f0b94f88650ced3ddb6e079f560e7ef142b8e4d53a5aee511ca1c2e3df4')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 minikube_$pkgver "$pkgdir/usr/bin/minikube"
}
