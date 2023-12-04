# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=bash-prompt
pkgname=$_pkgname-git
pkgver=r10.8a35d4e
pkgrel=1
pkgdesc="Bash plugin for powerlevel10k style prompt and WakaTime time tracking"
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname
license=(GPL3)
depends=(zsh-theme-powerlevel10k lsb-release procps-ng ncurses)
makedepends=(git)
source=("git+$url#tag=8a35d4e4fa22b97aa55b2399cb54d09e9faaf3fc")
sha256sums=(SKIP)

pkgver() {
	cd "$_pkgname" || return 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname" || return 1

	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	install -Dm644 prompt.sh -t "$pkgdir/usr/share/$_pkgname"
}
