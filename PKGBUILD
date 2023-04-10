# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: github
# what: openresty/lua-resty-lrucache
# match! rc[0-9]*$

pkgname=lua-resty-lrucache
pkgver=0.13
pkgrel=2

pkgdesc='Lua lrucache for nginx lua module'
arch=('any')
depends=('luajit')
url="https://github.com/openresty/lua-resty-lrucache"
license=('BSD')

source=("$pkgname-$pkgver.tar.gz::https://github.com/openresty/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=('573184006b98ccee2594b0d134fa4d05e5d2afd5141cbad315051ccf7e9b6403')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr LUA_LIB_DIR='$(PREFIX)/share/lua/$(LUA_VERSION)' LUA_VERSION=5.1 install
}
