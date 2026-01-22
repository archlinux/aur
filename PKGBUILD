# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname="cutefetch-git"
pkgdesc="A little fetch utility made with bare c and nice performance"
pkgver=29ad20b
pkgrel=3
arch=("any")
url="https://github.com/alphatechnolog/cutefetch"
source=("git+$url.git")
makedepends=("clang" "git")
license=("GPL3")
sha256sums=(SKIP)
depends=()
provides=("cutefetch")
conflicts=("cutefetch")

pkgver() {
    cd cutefetch
    printf "%s" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd cutefetch
  make CC=clang
}

package() {
  cd cutefetch
  install -Dm755 $provides "$pkgdir/usr/bin/$provides"
  install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

