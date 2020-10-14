# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: github openresty/lua-resty-core
pkgname=lua-resty-core
pkgver=0.1.20rc2
pkgrel=2

pkgdesc='Lua script engine for nginx lua module'
arch=('any')
depends=('luajit' 'lua-resty-lrucache' 'nginx')
url="https://github.com/openresty/lua-resty-core"
license=('BSD')

source=(
	https://github.com/openresty/lua-resty-core/archive/v$pkgver.tar.gz
)

sha256sums=('3966499a604720fe8fcd410ac47b140511eaaad50d26af4c1d19a51c00b56e79')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr LUA_LIB_DIR='$(PREFIX)/share/lua/$(LUA_VERSION)' LUA_VERSION=5.1 install
}
