# Maintainer: Energi <bloznelis05@gmail.com>
pkgname=typioca-git
name=typioca
pkgver=2.6.0
pkgrel=1
pkgdesc="Minimal, terminal based typing speed tester"
arch=(x86_64)
url="https://github.com/bloznelis/typioca"
license=(MIT)
groups=()
depends=()
makedepends=(make git go)
provides=("$name")
conflicts=("$name")
source=("git+$url#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$name"
  make VERSION=$pkgver build
}

package() {
  cd "$srcdir/$name"

  install -Dm755 execs/$name "$pkgdir/usr/bin/$name"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$name/"
}
