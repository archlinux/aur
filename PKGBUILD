# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=lsqlite3
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.9.6
_fossilver=v${pkgver//./}
_rockrel=1
pkgrel=6
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
_archive="${_rockname}_$_fossilver-$pkgrel"
source=("$_archive.zip::http://lua.sqlite.org/home/zip/$_archive.zip?uuid=v$pkgver")
sha256sums=('981c95e0ed1c45805abf309de48d40c8bdb6b63131331f484f9eae2a0502440c')

_package_helper() {
	cd "$_archive"
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
