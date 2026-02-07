# Maintainer: MilakyS <155958845+MilakyS@users.noreply.github.com>
pkgname=hexview-git
pkgver=r5.g0bb224e
pkgrel=1
pkgdesc="Simple CLI hex viewer"
arch=('x86_64')
url="https://github.com/MilakyS/HexViewer"
license=('MIT')
depends=()
makedepends=('git' 'gcc' 'make')
provides=('hexview')
conflicts=('hexview')

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 hexview "$pkgdir/usr/bin/hexview"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
