# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=('lua-http' 'lua51-http' 'lua52-http')
pkgver=0.3
pkgrel=1
arch=('any')
url='https://github.com/daurnimator/lua-http'
license=('MIT')
makedepends=('pandoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/daurnimator/lua-http/archive/v$pkgver.tar.gz")
md5sums=('946ff5fec05c2ff69333b060b8b160c1')

build() {
	cd "lua-http-$pkgver/doc"
	make lua-http.3
}

package_lua-http() {
	pkgdesc='HTTP Library for Lua 5.3'
	depends=('lua-cqueues'
	         'lua-luaossl'
	         'lua-basexx'
	         'lua-binaryheap'
	         'lua-lpeg'
	         'lua-lpeg-patterns'
	         'lua-fifo')
	optdepends=('lua-zlib: gzip compression'
	            'lua-psl: public suffix list checking')

	cd "lua-http-$pkgver"
	install -Dm644 http/*.lua -t "$pkgdir/usr/share/lua/5.3/http/"
	install -Dm644 http/compat/*.lua -t "$pkgdir/usr/share/lua/5.3/http/compat/"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 doc/lua-http.3 -t "$pkgdir/usr/share/man/man3/"
}

package_lua51-http() {
	pkgdesc='HTTP Library for Lua 5.1'
	depends=('lua51-compat53'
	         'lua51-bitop'
	         'lua51-cqueues'
	         'lua51-luaossl'
	         'lua51-basexx'
	         'lua51-binaryheap'
	         'lua51-lpeg'
	         'lua51-lpeg-patterns'
	         'lua51-fifo')
	optdepends=('lua51-zlib: gzip compression'
	            'lua51-psl: public suffix list checking')

	cd "lua-http-$pkgver"
	install -Dm644 http/*.lua -t "$pkgdir/usr/share/lua/5.1/http/"
	install -Dm644 http/compat/*.lua -t "$pkgdir/usr/share/lua/5.1/http/compat/"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-http() {
	pkgdesc='HTTP Library for Lua 5.2'
	depends=('lua52-compat53'
	         'lua52-cqueues'
	         'lua52-luaossl'
	         'lua52-basexx'
	         'lua52-binaryheap'
	         'lua52-lpeg'
	         'lua52-lpeg-patterns'
	         'lua52-fifo')
	optdepends=('lua52-zlib: gzip compression'
	            'lua52-psl: public suffix list checking')

	cd "lua-http-$pkgver"
	install -Dm644 http/*.lua -t "$pkgdir/usr/share/lua/5.2/http/"
	install -Dm644 http/compat/*.lua -t "$pkgdir/usr/share/lua/5.2/http/compat/"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
