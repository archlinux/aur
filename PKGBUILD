# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: github openresty/lua-resty-core
pkgname=lua-resty-core
pkgver=0.1.20
pkgrel=1

pkgdesc='Lua script engine for nginx lua module'
arch=('any')
depends=('luajit' 'lua-resty-lrucache' 'nginx')
url="https://github.com/openresty/lua-resty-core"
license=('BSD')

source=(
	https://github.com/openresty/lua-resty-core/archive/v$pkgver.tar.gz
)

sha256sums=('3e1c7a2fb61c069fffe756b04c1dc1695987d93719389478a40798663f0e34b1')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr LUA_LIB_DIR='$(PREFIX)/share/lua/$(LUA_VERSION)' LUA_VERSION=5.1 install
}
