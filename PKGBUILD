# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
_pkgname=luarocks-build-xmake
pkgname=(lua{,51,52,53}-"$_pkgname")
pkgver=1.4
pkgrel=1
pkgdesc="A luarocks build module based on xmake"
arch=(any)
url=https://github.com/xmake-io/luarocks-build-xmake
license=(MIT)
depends=(luarocks xmake)
makedepends=(luarocks)
_revision=1
source=("https://luarocks.org/manifests/waruqi/luarocks-build-xmake-$pkgver-$_revision.rockspec")
sha256sums=('213f85444b990c635f1d96096c40557c0803d7b9b765c0fb8a0c0686b7bd4249')
_lua_version=5.4

_package() {
	luarocks install --no-manifest --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none ./*.rockspec
}

package_lua51-luarocks-build-xmake() {
	_package 5.1
}

package_lua52-luarocks-build-xmake() {
	_package 5.2
}

package_lua53-luarocks-build-xmake() {
	_package 5.3
}

package_lua-luarocks-build-xmake() {
	_package $_lua_version
}
# ex: nowrap
