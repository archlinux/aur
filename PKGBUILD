# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: github openresty/lua-resty-core
pkgname=lua-resty-core
pkgver=0.1.22
pkgrel=1

pkgdesc='Lua script engine for nginx lua module'
arch=('any')
depends=('luajit' 'lua-resty-lrucache' 'nginx')
url="https://github.com/openresty/lua-resty-core"
license=('BSD')

source=("$pkgname-$pkgver.tar.gz::https://github.com/openresty/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=('4d971f711fad48c097070457c128ca36053835d8a3ba25a937e9991547d55d4d')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr LUA_LIB_DIR='$(PREFIX)/share/lua/$(LUA_VERSION)' LUA_VERSION=5.1 install
}
