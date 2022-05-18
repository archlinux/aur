# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: github
# what: openresty/lua-resty-core
# match! rc[0-9]*$

pkgname=lua-resty-core
pkgver=0.1.23
pkgrel=1
epoch=1

pkgdesc='Lua script engine for nginx lua module'
arch=('any')
depends=('luajit' 'lua-resty-lrucache' 'nginx')
url="https://github.com/openresty/lua-resty-core"
license=('BSD')

source=("$pkgname-$pkgver.tar.gz::https://github.com/openresty/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=('efd6b51520429e64b1bcc10f477d370ebed1631c190f7e4dc270d959a743ad7d')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr LUA_LIB_DIR='$(PREFIX)/share/lua/$(LUA_VERSION)' LUA_VERSION=5.1 install
}
