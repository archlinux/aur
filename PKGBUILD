# Maintainer: Dheeraj Reddy <dheerajre@protone.me>
pkgname=pallene-tracer
pkgver="0.5.0a"
pkgrel=1
pkgdesc="Allows Lua libraries written in C to have proper function tracebacks, without changing a single code in Lua"
arch=('x86_64')
url="https://github.com/pallene-lang/pallene-tracer"
license=('MIT')
depends=('pallene-lua')
source=("$pkgname::git+$url#tag=$pkgver")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"

    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/include"

	make install PREFIX="$pkgdir/usr"
}
