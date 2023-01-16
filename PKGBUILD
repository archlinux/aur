# Maintainer: mickaelca <contact@mickael-caudrelier.fr>
pkgname=helmify-bin
pkgver=0.3.22
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
6ae7fa6726fd09a39d1b60c4ce7df7edc3fb4fbee2fc99211c217870cf8d226b
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
