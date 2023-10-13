# Maintainer: mickaelca <contact@mickael-caudrelier.fr>
pkgname=helmify-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="Creates Helm chart from Kubernetes yaml"
provides=('helmify')
arch=('x86_64')
url="https://github.com/arttor/helmify"
license=("APACHE")
source=(
$pkgname-$pkgver.tar.gz::https://github.com/arttor/helmify/releases/download/v${pkgver}/helmify_Linux_x86_64.tar.gz
)
sha256sums=(
20667b6ff425f68c5e3798b7e6c5723458277cd83441885308e86e933cfdd0a0
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
