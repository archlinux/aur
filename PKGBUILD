# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: github openresty/lua-resty-core
pkgname=lua-resty-core
pkgver=0.1.20rc1
pkgrel=1

pkgdesc='Lua script engine for nginx lua module'
arch=('any')
depends=('luajit' 'lua-resty-lrucache' 'nginx')
url="https://github.com/openresty/lua-resty-core"
license=('BSD')

source=(
	https://github.com/openresty/lua-resty-core/archive/v$pkgver.tar.gz
)

sha256sums=('3aa9df9023a8af43685af2bffd492418c5d21402f6eb0236b6c8c70255343302')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr LUA_VERSION=5.1 install
}
