# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: github openresty/lua-resty-lrucache
pkgname=lua-resty-lrucache
pkgver=0.11
pkgrel=1

pkgdesc='Lua lrucache for nginx lua module'
arch=('any')
depends=('luajit')
url="https://github.com/openresty/lua-resty-lrucache"
license=('BSD')

source=("$pkgname-$pkgver.tar.gz::https://github.com/openresty/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=('e810ed124fe788b8e4aac2c8960dda1b9a6f8d0ca94ce162f28d3f4d877df8af')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr LUA_LIB_DIR='$(PREFIX)/share/lua/$(LUA_VERSION)' LUA_VERSION=5.1 install
}
