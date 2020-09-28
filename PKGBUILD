# Maintainer: Cameron Banta <cbanta@gmail.com>
# Contributor: Francesco Colista <francesco.colista@gmail.com>
# Contributor: Lennart Eichhorn <lennart@madmanfred.com>

pkgname=(lua-pc lua51-pc lua52-pc lua53-pc)
pkgver=1.0.0
pkgrel=3
pkgdesc="Lua Process Call (lpc)"
license=('MIT/X11')
arch=('i686' 'x86_64')
url="https://github.com/fabled/lpc"
makedepends=('git' 'lua' 'lua51' 'lua52' 'lua53')
source=( git+https://github.com/fabled/lpc.git )
md5sums=('SKIP')

build() {
    mkdir -p 5.1 5.2 5.3 5.4
	cd "$srcdir/lpc"
	make LUA_PKGCONF=lua51 TARGET=../5.1/lpc.so
	make clean
	make LUA_PKGCONF=lua52 TARGET=../5.2/lpc.so
	make clean
	make LUA_PKGCONF=lua53 TARGET=../5.3/lpc.so
	make clean
	make LUA_PKGCONF=lua TARGET=../5.4/lpc.so
	make clean
}

package_lua51-pc() {
	pkgdesc='Lua Process Call (lpc) for Lua 5.1'
	depends+=('lua51')
	cd "$srcdir"
	install -d "$pkgdir"/usr/lib/lua/5.1
	install 5.1/lpc.so "$pkgdir"/usr/lib/lua/5.1/lpc.so
    install -Dm644 lpc/COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

package_lua52-pc() {
	pkgdesc='Lua Process Call (lpc) for Lua 5.2'
	depends+=('lua52')
	cd "$srcdir"
	install -d "$pkgdir"/usr/lib/lua/5.2
	install 5.2/lpc.so "$pkgdir"/usr/lib/lua/5.2/lpc.so
    install -Dm644 lpc/COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

package_lua53-pc() {
	pkgdesc='Lua Process Call (lpc) for Lua 5.3'
	depends+=('lua53')
	cd "$srcdir"
	install -d "$pkgdir"/usr/lib/lua/5.3
	install 5.3/lpc.so "$pkgdir"/usr/lib/lua/5.3/lpc.so
    install -Dm644 lpc/COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

package_lua-pc() {
	pkgdesc='Lua Process Call (lpc) for Lua 5.4'
	depends+=('lua')
	cd "$srcdir"
	install -d "$pkgdir"/usr/lib/lua/5.4
	install 5.4/lpc.so "$pkgdir"/usr/lib/lua/5.4/lpc.so
    install -Dm644 lpc/COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
