pkgname=kube-pod-connect
pkgver=0.0.2
pkgrel=2
pkgdesc='Simple connect to kubernetes pod'
arch=(any)
url='https://github.com/LersSett/kube-pod-connect'
license=(MIT)
depends=(
  zsh
  kubectl-bin
)
makedepends=(rust)
source=(
  https://github.com/LersSett/$pkgname/archive/$pkgver.tar.gz
)
sha1sums=(
  dce5c60049a3ee975aed6ef9426349a1695c3376
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/target/release/kube-pod-connect" "$pkgdir/usr/bin/kube-pod-connect"
  install -Dm 644 "$srcdir/$pkgname-$pkgver/_kube-pod-connect" "$pkgdir/usr/share/zsh/functions/Completion/Base/_kube-pod-connect"
}
