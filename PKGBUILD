# Maintainer: Brad Erhart <brae.04+aur@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=kubernetes-kubectl
pkgdesc="Controls the Kubernetes cluster manager"
url="http://kubernetes.io/"
pkgver=1.10.0
pkgrel=1
arch=(x86_64 i686)
makedepends=(go rsync go-bindata)
conflicts=(kubernetes kubectl-bin)
license=(Apache)
source=("https://github.com/kubernetes/kubernetes/archive/v$pkgver.tar.gz")
sha256sums=(d547dd66ce90fdf04fccc655ff02cc0c63ab1ce13f7e5ac136f77122ff2b22db)

build() {
  cd "$srcdir/kubernetes-$pkgver"
  make WHAT=cmd/kubectl
}

package() {
  install -Dm 755 "$srcdir/kubernetes-$pkgver/_output/bin/kubectl" "$pkgdir/usr/bin/kubectl"
}
