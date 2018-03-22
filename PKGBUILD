# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Matt Rickard <mrick@google.com> 
# Contributor: Brad Erhart <brae.04+aur@gmail.com>

pkgname=minikube
pkgver=0.25.2
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
  'docker-machine-driver-kvm2'
)
makedepends=()

source=(minikube_$pkgver::https://storage.googleapis.com/minikube/releases/v$pkgver/minikube-linux-amd64)
sha256sums=('41d666ddc9ea1eee3d08a939b1075347da7e670c93836d2756ee5ef1daaa1457')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 minikube_$pkgver "$pkgdir/usr/bin/minikube"
}
