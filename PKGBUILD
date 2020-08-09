# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>

pkgname=lua-resty-core
pkgver=0.1.19
pkgrel=2

pkgdesc='Lua script engine for nginx lua module'
arch=('any')
depends=('luajit' 'lua-resty-lrucache' 'nginx')
url="https://github.com/openresty/lua-resty-core"
license=('BSD')

source=(
	https://github.com/openresty/lua-resty-core/archive/v$pkgver.tar.gz
)

sha256sums=('040878ed9a485ca7f0f8128e4e979280bcf501af875704c8830bec6a68f128f7')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr LUA_VERSION=5.1 install
}
