# Maintainer: Nai Erchou <naierchou@mail.ru>
pkgname=docs-data-alpinejs-git
pkgver=0.0.1
pkgrel=0
epoch=
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "alpinejs-doc" "alpinejs-doc-git")
pkgdesc="AlpineJs offline documentation data for docs viewer"
arch=('any')
url="https://gitverse.ru/naierchou/docs-data-alpinejs"
license=('MIT')
depends=('webappview-git')
makedepends=()
source=("git+https://gitverse.ru/naierchou/docs-data-alpinejs.git" "git+https://github.com/alpinejs/alpine.git")
sha256sums=("SKIP" "SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git rev-parse --short HEAD
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make install BASEDIR="$pkgdir" SRCDIR="$srcdir"
}
