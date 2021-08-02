# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Kilian Guillaume "cafehaine" <kilian dot guillaume at gmail dot com>

_rockname=std-_debug
pkgbase=lua-$_rockname
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
_pkgname=_debug
pkgver=1.0.1
_rockrel=1
pkgrel=5
pkgdesc='Lua Debug Hints Library'
arch=(any)
url="https://github.com/lua-stdlib/$_pkgname"
license=(MIT)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('efc560540f08dcf880ac48c6ab527bd741bbe3d6d66202a3c8be3ff5c9e1e907')

_package_helper() {
	cd "$_pkgname-$pkgver"
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "${_rockname/-/.}-$pkgver-$_rockrel.rockspec"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}

package_lua-std-_debug() {
	depends+=(lua)
	_package_helper 5.4
}

package_lua53-std-_debug() {
	depends+=(lua53)
	_package_helper 5.3
}

package_lua52-std-_debug() {
	depends+=(lua52)
	_package_helper 5.2
}

package_lua51-std-_debug() {
	depends+=(lua51)
	_package_helper 5.1
}

