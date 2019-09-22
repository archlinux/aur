
# Maintainer: James Bulmer <me@nekinie.com>
# Maintainer: Victor Häggqvist <aur a snilius d com>

pkgname=migrate
pkgver=4.6.2
pkgrel=2
pkgdesc="Database migration handling"
url="https://github.com/golang-migrate/migrate"
arch=("x86_64")
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/golang-migrate/migrate/archive/v$pkgver.tar.gz")
sha256sums=("f7f07e240bc2d0afbcafc83f46eef0136ceb678ced4ece87ed619e901993c569")
makedepends=("go")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build-cli VERSION=$pkgver
}

package() {
  install -d "${pkgdir}/usr/bin"
  mv "$srcdir/$pkgname-$pkgver/cli/build/$pkgname.linux-amd64" "$pkgdir/usr/bin/$pkgname"
}
