# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: github openresty/lua-resty-lrucache
pkgname=lua-resty-lrucache
pkgver=0.11rc1
pkgrel=1

pkgdesc='Lua lrucache for nginx lua module'
arch=('any')
depends=('luajit')
url="https://github.com/openresty/lua-resty-lrucache"
license=('BSD')

source=("$pkgname-$pkgver.tar.gz::https://github.com/openresty/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=('b4f9a5e7bc76e6c430bac6b8d24cdcea69f1d106b773bf9ecdf020a1f2cd81a2')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr LUA_LIB_DIR='$(PREFIX)/share/lua/$(LUA_VERSION)' LUA_VERSION=5.1 install
}
