# Maintainer: Muhkoenig

pkgname=minikube-bin
pkgver=0.19.0
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
conflicts=('minikube')

source=(minikube_$pkgver::https://storage.googleapis.com/minikube/releases/v$pkgver/minikube-linux-amd64)
sha256sums=('1b3447b307fa256378c9541731cfc5d5b06128f88dab04b3cfc9deeeceddb2bf')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 minikube_$pkgver "$pkgdir/usr/bin/minikube"
}
