# Maintainer: Fijxu <fijxu at nadeko dot net>
# from: github
# what: ledgetech/lua-resty-http
# match! rc[0-9]*$

pkgname=lua-resty-http
pkgver=0.17.2
pkgrel=1
epoch=1

pkgdesc='Lua HTTP client cosocket driver for OpenResty / ngx_lua'
arch=('any')
depends=('luajit' 'lua-resty-core' 'nginx')
url="https://github.com/openresty/lua-resty-core"
license=('BSD-2-Clause')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ledgetech/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=('3da18ca8582243eff28302591e36651dc7fab046e77336aa4a6fa718bccce4a2')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr LUA_LIB_DIR='$(PREFIX)/share/lua/$(LUA_VERSION)' LUA_VERSION=5.1 install
}
