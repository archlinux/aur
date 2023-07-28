# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=prompt-style
pkgname=lua-$_pkgname
pkgver=0.0.1
pkgrel=1
pkgdesc="powerlevel10k style for luaprompt"
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname.lua
license=(GPL3)
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-0.all.rock")
sha256sums=(SKIP)

package() {
	cd "$_pkgname" || return 1
	local version
	version="$(lua -v)"
	version=${version#* }
	version=${version%% *}
	version=${version%.*}
	luarocks install --lua-version=${version} --tree="$pkgdir/usr/" --deps-mode=none ./*.rock
}
