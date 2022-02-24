# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=ltdiff
_project=luatablediff
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=1.0
_rockrel=1
pkgrel=1
pkgdesc='Diffing and patching for Lua tables'
arch=(any)
url="https://github.com/martinfelis/$_project"
license=(MIT)
makedepends=(lua lua53 lua52 lua51 luarocks)
_archive="$_project-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('ef8b70bf9d9d78b3a74bad8b45fe920df30a24dc0c587441e2b87e535f0c6f6c')

_package_helper() {
	cd "$_archive"
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-ltdiff() {
	depends=(lua)
	_package_helper 5.4
}

package_lua53-ltdiff() {
	depends=(lua53)
	_package_helper 5.3
}

package_lua52-ltdiff() {
	depends=(lua52)
	_package_helper 5.2
}

package_lua51-ltdiff() {
	depends=(lua51)
	_package_helper 5.1
}
