# Maintainer: mickaelca <contact@mickael-caudrelier.fr>
pkgname=helmify-bin
pkgver=0.3.23
pkgrel=1
pkgdesc="Creates Helm chart from Kubernetes yaml"
provides=('helmify')
arch=('x86_64')
url="https://github.com/arttor/helmify"
license=("APACHE")
source=(
$pkgname-$pkgver.tar.gz::https://github.com/arttor/helmify/releases/download/v${pkgver}/helmify_${pkgver}_Linux_64-bit.tar.gz
)
sha256sums=(
cc60a97bf823ac779f4f5225344a737bfc693aafc7ed5d30753b3e23b2441bf9
)

build() {
  cd "$srcdir"
  tar xvf $pkgname-$pkgver.tar.gz
}

package () {
  cd "$pkgdir"

  mkdir -p "usr/bin"

  install -Dm755 "$srcdir/${provides}" "$pkgdir/usr/bin/${provides}"

}
