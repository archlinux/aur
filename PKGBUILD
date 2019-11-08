
# Maintainer: James Bulmer <me@nekinie.com>
# Maintainer: Victor Häggqvist <aur a snilius d com>

pkgname=migrate
pkgver=4.7.0
pkgrel=1
pkgdesc="Database migration handling"
url="https://github.com/golang-migrate/migrate"
arch=("x86_64")
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/golang-migrate/migrate/archive/v$pkgver.tar.gz")
sha256sums=("d3f5d2ede4dac95cc2ccf0ec051331e3980b5414b182d9854da2baa0d9cbdfb1")
makedepends=("go")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build-cli VERSION=$pkgver
}

package() {
  install -d "${pkgdir}/usr/bin"
  mv "$srcdir/$pkgname-$pkgver/cli/build/$pkgname.linux-amd64" "$pkgdir/usr/bin/$pkgname"
}
