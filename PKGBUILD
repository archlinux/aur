# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=(lua-promise-async-git lua51-promise-async-git lua52-promise-async-git lua53-promise-async-git neovim-promise-async-git)
pkgver=1.0.0.r1.g842dca3
pkgrel=2
pkgdesc="Promise & Async in Lua"
arch=('any')
url="https://github.com/kevinhwang91/promise-async"
license=('BSD')
makedepends=('git')
source=("lua-promise-async-git::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd lua-promise-async-git
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_lua-promise-async-git() {
	provides=(lua-promise-async)
	conflicts=(lua-promise-async)
	cd lua-promise-async-git/lua
	find . \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/lua/5.4/{}" \;
	cd ..
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_lua51-promise-async-git() {
	provides=(lua51-promise-async)
	conflicts=(lua51-promise-async)
	cd lua-promise-async-git/lua
	find . \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/lua/5.1/{}" \;
	cd ..
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_lua52-promise-async-git() {
	provides=(lua52-promise-async)
	conflicts=(lua52-promise-async)
	cd lua-promise-async-git/lua
	find . \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/lua/5.2/{}" \;
	cd ..
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_lua53-promise-async-git() {
	provides=(lua53-promise-async)
	conflicts=(lua53-promise-async)
	cd lua-promise-async-git/lua
	find . \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/lua/5.3/{}" \;
	cd ..
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-promise-async-git() {
	depends=(neovim)
	provides=(neovim-promise-async)
	conflicts=(neovim-promise-async)
	cd lua-promise-async-git/lua
	find . \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/plugins/start/neovim-promise-async-git/lua/{}" \;
	cd ..
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
