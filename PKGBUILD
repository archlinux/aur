
# Maintainer: James Bulmer <me@nekinie.com>
# Maintainer: Victor Häggqvist <aur a snilius d com>

pkgname=migrate
pkgver=4.9.1
pkgrel=1
pkgdesc="Database migration handling"
url="https://github.com/golang-migrate/migrate"
arch=("x86_64")
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/golang-migrate/migrate/archive/v$pkgver.tar.gz")
sha256sums=("6be8806c9e7cc95dea74560292061735642aad45de5de2ebc7e83ae789850655")
makedepends=("go")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build-cli VERSION=$pkgver
}

package() {
  install -d "${pkgdir}/usr/bin"
  mv "$srcdir/$pkgname-$pkgver/cli/build/$pkgname.linux-amd64" "$pkgdir/usr/bin/$pkgname"
}
