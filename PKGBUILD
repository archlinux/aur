# Maintainer: Fijxu <fijxu at nadeko dot net>
# from: github
# what: openresty/lua-resty-string
# match! rc[0-9]*$

pkgname=lua-resty-string
pkgver=0.16
pkgrel=1
epoch=1

pkgdesc='String utilities and common hash functions for ngx_lua and LuaJIT'
arch=('any')
depends=('luajit' 'lua-resty-core' 'nginx')
url="https://github.com/openresty/lua-resty-core"
license=('BSD-2-Clause')

source=("$pkgname-$pkgver.tar.gz::https://github.com/openresty/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=('77f006a97fd4a3be4a82dcf2d5f1482e399b70fb35454c5b5ad4b97ff1dded0d')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr LUA_LIB_DIR='$(PREFIX)/share/lua/$(LUA_VERSION)' LUA_VERSION=5.1 install
}
