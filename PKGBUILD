# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=kubernetes-kubectl
pkgdesc="Controls the Kubernetes cluster manager"
url="http://kubernetes.io/"
pkgver=1.4.6
pkgrel=1
arch=(x86_64 i686)
makedepends=(go rsync go-bindata-git)
conflicts=(kubernetes kubectl-bin)
license=(Apache)
source=("https://github.com/kubernetes/kubernetes/archive/v$pkgver.tar.gz")
sha256sums=(dcbbf24ca664f55e40d539a167143f2e0ea0f3ff40e7df6e25887ca10bb2e185)

build() {
  cd "$srcdir/kubernetes-$pkgver"
  make WHAT=cmd/kubectl
}

package() {
  install -Dm 755 "$srcdir/kubernetes-$pkgver/_output/bin/kubectl" "$pkgdir/usr/bin/kubectl"
}
