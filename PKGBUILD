# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
_pkgname=native-objects
pkgname=(lua{,51,52,53}-"$_pkgname")
pkgver=0.0.1
pkgrel=1
pkgdesc="A Lua bindings generator written in Lua"
arch=(any)
url=https://github.com/Neopallium/LuaNativeObjects
license=(GPL3)
makedepends=(luarocks)
source=("https://luarocks.org/manifests/Freed-Wu/native-objects-scm-1.rockspec")
sha256sums=('6d5926b3c6950f4be1cb7f276db373a89f2a8c4e93424578548b2be0ea031e3d')
_lua_version=5.4

_package() {
	optdepends=("lua${1/./}-$_pkgname")
	luarocks install --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none ./*.rockspec
	rm $pkgdir/usr/lib/luarocks/rocks-*/manifest
}

package_lua51-native-objects() {
	_package 5.1
}

package_lua52-native-objects() {
	_package 5.2
}

package_lua53-native-objects() {
	_package 5.3
}

package_lua-native-objects() {
	_package $_lua_version
}
# ex: nowrap
