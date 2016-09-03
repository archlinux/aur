# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds

pkgname=minikube
pkgver=0.8.0
pkgrel=2
pkgdesc="Minikube is a tool that makes it easy to run Kubernetes locally"
url="https://github.com/kubernetes/minikube"
license=('Apache')
arch=('x86_64')
depends=(
  'virtualbox'
)
optdepends=(
  'kubectl-bin: to manage the cluster'
)
makedepends=()

source=(minikube_$pkgver::https://storage.googleapis.com/minikube/releases/v$pkgver/minikube-linux-amd64)
sha512sums=('a01a7cd4e00e466176fd9e0b01480c6510b2210a2a4fe9341b2d5b7bb05e1c14b6d960e833653de5f5ccd2f345c8ade58969e015b322432ad170e9395e3d5cd4')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 minikube_$pkgver "$pkgdir/usr/bin/minikube"
}
