# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=lua-template
pkgname=(lua{,53}-"$_pkgname")
pkgver=1.0.0
pkgrel=1
pkgdesc="Efficient template engine for Lua"
arch=(x86 x86_64 arm aarch64)
url=https://github.com/anaef/lua-template
license=(MIT)
makedepends=(luarocks git)
_revision=1
source=("https://luarocks.org/manifests/anaef/$_pkgname-$pkgver-$_revision.rockspec")
sha256sums=('538a000e6c889903a5c853718f75ceccb5032f555d28fa06f742429c6c8b3a68')
_lua_version=5.4

_package() {
	install -Dm644 ./*.rockspec -t $1
	luarocks install --no-manifest --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none $1/*.rockspec
}

package_lua53-lua-template() {
	local version=5.3
	_package $version
}

package_lua-lua-template() {
	local version=$_lua_version
	_package $version
}
