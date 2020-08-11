# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>

pkgname=lua-resty-lrucache
pkgver=0.10
pkgrel=2

pkgdesc='Lua lrucache for nginx lua module'
arch=('any')
depends=('luajit')
url="https://github.com/openresty/lua-resty-lrucache"
license=('BSD')

source=(
	https://github.com/openresty/lua-resty-lrucache/archive/v$pkgver.tar.gz
)

sha256sums=('dae9fb572f04e7df0dabc228f21cdd8bbfa1ff88e682e983ef558585bc899de0')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr LUA_VERSION=5.1 install
}
