# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=postgresql-libversion
pkgver=2.0.0
pkgrel=2
pkgdesc="PostgreSQL extension with support for version string comparison"
arch=('x86_64')
url="https://github.com/repology/postgresql-libversion"
license=('MIT')
depends=('libversion' 'postgresql')
makedepends=('postgresql-libs' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('7def4056c6b34a8ba03faa47d3a0922089e5809db3d35d572cbc5ac1c605668f28fa20cae9bd2ecdb04d8704c5c5e04d9a305c7d19a2b695f35e0b31506d50b7')

build() {
	make -C "$pkgname-$pkgver"
}

package() {
	make \
    -C "$pkgname-$pkgver" \
    DESTDIR="$pkgdir" \
    install

  install -vDm644 "$pkgname-$pkgver/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname"
}
