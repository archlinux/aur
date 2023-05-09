# Maintainer: mickaelca <contact@mickael-caudrelier.fr>
pkgname=helmify-bin
pkgver=0.4.3
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
550fbce3f54e181029abb86188084b136f15b700cbc748e761b0577800badde8
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
