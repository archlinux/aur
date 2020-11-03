# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: github openresty/lua-resty-core
pkgname=lua-resty-core
pkgver=0.1.21
pkgrel=1

pkgdesc='Lua script engine for nginx lua module'
arch=('any')
depends=('luajit' 'lua-resty-lrucache' 'nginx')
url="https://github.com/openresty/lua-resty-core"
license=('BSD')

source=("$pkgname-$pkgver.tar.gz::https://github.com/openresty/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=('a377fbce78ba10f3ed3a8b5173ea318f8cf8da9d2ab127bb1e1f263078bf7da0')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr LUA_LIB_DIR='$(PREFIX)/share/lua/$(LUA_VERSION)' LUA_VERSION=5.1 install
}
