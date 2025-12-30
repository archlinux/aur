# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=platformdirs
pkgname=(lua{,51,52,53}-"$_pkgname")
pkgver=0.2.11
pkgrel=1
pkgdesc="Respect the standards of Unix XDG, Android, macOS, Windows"
arch=(any)
url=https://github.com/rimeinn/rime.nplatformdirs/tree/main/packages/platformdirs
license=(GPL3)
makedepends=(luarocks)
_revision=2
source=("https://luarocks.org/manifests/freed-wu/platformdirs-$pkgver-1.src.rock")
sha256sums=('43681a23e466a046b958e30f7ab79c711507aeb259cddae7565ce5c88dee38b6')
_lua_version=5.4

_package() {
	install -Dm644 ./*.rock -t $1
	luarocks install --no-manifest --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none $1/*.rock
}

package_lua51-platformdirs() {
	local version=5.1
	depends=(lua51-vim)
	_package $version
}

package_lua52-platformdirs() {
	local version=5.2
	depends=(lua52-vim)
	_package $version
}

package_lua53-platformdirs() {
	local version=5.3
	depends=(lua53-vim)
	_package $version
}

package_lua-platformdirs() {
	depends=(lua-vim)
	local version=$_lua_version
	_package $version
}
