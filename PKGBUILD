# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=pandocp
pkgbase=lua-pandocp
pkgname=(lua54-"$_pkgname")
pkgver=0.1.0
pkgrel=1
pkgdesc="Respect the standards of Unix XDG, Android, macOS, Windows"
arch=(any)
url=https://github.com/wakatime/prompt-style.lua/tree/main/packages/pandocp
license=(GPL3)
makedepends=(luarocks)
depends=(pandoc)
_revision=1
source=("https://luarocks.org/manifests/freed-wu/pandocp-$pkgver-$_revision.src.rock")
sha256sums=('1bd923a1488defdc44dfdea55b525652f868805dad74d43318e2b15392dfbf1f')

_package() {
	install -Dm644 ./*.rock -t $1
	luarocks install --no-manifest --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none $1/*.rock
}

package_lua54-pandocp() {
	depends=(lua54-prompt-style)
	_package 5.4
}
