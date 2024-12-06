# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
_pkgname=dottify
pkgname=(lua{,51,52,53}-"$_pkgname")
pkgver=0.0.1
pkgrel=1
pkgdesc="generate a graphviz graph from a lua table structure"
arch=(any)
url=https://git.ignore.pl/lua-dottify
license=(GPL3)
makedepends=(luarocks)
source=("dottify-scm-1.rockspec")
sha256sums=('SKIP')
_lua_version=5.4

_package() {
	luarocks install --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none ./*.rockspec
	rm $pkgdir/usr/lib/luarocks/rocks-*/manifest
}

package_lua51-dottify() {
	_package 5.1
}

package_lua52-dottify() {
	_package 5.2
}

package_lua53-dottify() {
	_package 5.3
}

package_lua-dottify() {
	_package $_lua_version
}
# ex: nowrap
