# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=lsqlite3
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.9.6
_fossilver=v${pkgver//./}
_rockrel=1
pkgrel=7
pkgdesc='A binding for Lua to the SQLite3 database library'
arch=(x86_64 i686)
url='http://lua.sqlite.org'
license=(MIT)
depends=(sqlite)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
source=("archive.zip::http://lua.sqlite.org/home/zip/archive.zip?uuid=v$pkgver")
sha256sums=('524b4dd1d254967141d04faac6ccc3cf4cf4e2ae9e0dd3fc83da872e3844353f')

_package_helper() {
	cd archive
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-lsqlite3() {
	depends+=(lua)
	_package_helper 5.4
}

package_lua53-lsqlite3() {
	depends+=(lua53)
	_package_helper 5.3
}

package_lua52-lsqlite3() {
	depends+=(lua52)
	_package_helper 5.2
}

package_lua51-lsqlite3() {
	depends+=(lua51)
	_package_helper 5.1
}
