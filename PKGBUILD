# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Matt Rickard <mrick@google.com> 

pkgname=minikube
pkgver=0.12.0
pkgrel=1
pkgdesc="Minikube is a tool that makes it easy to run Kubernetes locally"
url="https://github.com/kubernetes/minikube"
license=('Apache')
arch=('x86_64')
depends=(
  'virtualbox'
  'net-tools'
)
optdepends=(
  'kubectl-bin: to manage the cluster'
)
makedepends=()

source=(minikube_$pkgver::https://storage.googleapis.com/minikube/releases/v$pkgver/minikube-linux-amd64)
sha512sums=('3aa3760088192dbe024627d63a51a9090b685deb4fa0ec7b9ed87a7f1a35e5324ae2724fe0889aa6c5c3ee2a9707bb7bb967d5cd18be65a134e275d896d561b3')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 minikube_$pkgver "$pkgdir/usr/bin/minikube"
}
