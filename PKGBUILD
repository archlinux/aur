# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=(lua-http lua51-http lua52-http)
pkgver=0.1
pkgrel=0
arch=('any')
url='https://github.com/daurnimator/lua-http'
license=('MIT')
makedepends=('pandoc')
source=("https://github.com/daurnimator/lua-http/archive/v$pkgver.tar.gz")
md5sums=('f5da73665fb3a13cd600e8b17e0c1bb9')

build() {
	cd lua-http-"$pkgver"/doc
	make lua-http.3
}

package_lua-http() {
	pkgdesc='HTTP Library for Lua 5.3'
	depends=('lua-cqueues>=20161214'
	         'lua-luaossl>=20161208'
	         'lua-basexx>=0.2.0'
	         'lua-lpeg'
	         'lua-lpeg-patterns>=0.3'
	         'lua-fifo')
	optdepends=('lua-zlib: gzip compression')

	cd lua-http-"$pkgver"
	install -Dm644 http/*.lua -t "$pkgdir"/usr/share/lua/5.3/http/
	install -Dm644 http/compat/*.lua -t "$pkgdir"/usr/share/lua/5.3/http/compat/
	install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 doc/lua-http.3 -t "$pkgdir"/usr/share/man/man3/
}

package_lua51-http() {
	pkgdesc='HTTP Library for Lua 5.1'
	depends=('lua51-compat53>=0.3'
	         'lua51-bitop'
	         'lua51-cqueues>=20161214'
	         'lua51-luaossl>=20161208'
	         'lua51-basexx>=0.2.0'
	         'lua51-lpeg'
	         'lua51-lpeg-patterns>=0.3'
	         'lua51-fifo')
	optdepends=('lua51-zlib: gzip compression')

	cd lua-http-"$pkgver"
	install -Dm644 http/*.lua -t "$pkgdir"/usr/share/lua/5.1/http/
	install -Dm644 http/compat/*.lua -t "$pkgdir"/usr/share/lua/5.1/http/compat/
	install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lua52-http() {
	pkgdesc='HTTP Library for Lua 5.2'
	depends=('lua52-compat53>=0.3'
	         'lua52-cqueues>=20161214'
	         'lua52-luaossl>=20161208'
	         'lua52-basexx>=0.2.0'
	         'lua52-lpeg'
	         'lua52-lpeg-patterns>=0.3'
	         'lua52-fifo')
	optdepends=('lua52-zlib: gzip compression')

	cd lua-http-"$pkgver"
	install -Dm644 http/*.lua -t "$pkgdir"/usr/share/lua/5.2/http/
	install -Dm644 http/compat/*.lua -t "$pkgdir"/usr/share/lua/5.2/http/compat/
	install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
