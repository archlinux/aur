# Maintainer: Gabriel Borges <dev.gabrielsborges@proton.me>
pkgname=rpc-git
pkgver=1.1.0
_commit=9a4e0dcf388cedb8aa2cf88a03f50a1c1598ec6f
pkgrel=1
pkgdesc="Cross-platform command-line utility for managing prompt templates."
arch=('x86_64')
url="https://github.com/devgabrielsborges/replica"
license=('MIT')
depends=()
makedepends=('git' 'meson' 'ninja')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$srcdir/replica"
  meson setup builddir --prefix=/usr
  meson compile -C builddir
}

package() {
  cd "$srcdir/replica"
  meson install -C builddir --destdir="$pkgdir"
}
