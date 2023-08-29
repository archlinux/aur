# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=bash-prompt
pkgname=$_pkgname-git
pkgver=r8.5efa0f4
pkgrel=1
pkgdesc="A powerlevel10k-like prompt style of bash."
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname
license=(GPL3)
depends=(zsh-theme-powerlevel10k lsb-release procps-ng ncurses)
makedepends=(git)
source=("git+$url#tag=5efa0f4c283579bb5bd35d568ba338729b764cc8")
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
