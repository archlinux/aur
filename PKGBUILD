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
depends=(lua-ansicolors lua-filesystem)
makedepends=(luarocks)
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-0.all.rock")
sha256sums=('ce50c187cf7bf1c4161bd776ec226ca212873387f85681e1f0da75625159d2be')

package() {
	local version
	version="$(lua -v)"
	version=${version#* }
	version=${version%% *}
	version=${version%.*}
	luarocks install --lua-version=${version} --tree="$pkgdir/usr/" --deps-mode=none ./*.rock
	rm $pkgdir/usr/lib/luarocks/rocks-*/manifest
}
