# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=bash-prompt-style
pkgname=$_pkgname-git
pkgver=r4.2990a68
pkgrel=1
pkgdesc="A powerlevel10k-like prompt style of bash."
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname
license=(GPL3)
depends=(zsh-theme-powerlevel10k lsb-release procps-ng)
makedepends=(git)
source=("git+$url#tag=2990a6878db565fa866ddbad5dba0b99d67e378f")
sha256sums=(SKIP)

pkgver() {
	cd "$_pkgname" || return 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname" || return 1

	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	install -Dm644 prompt-style.sh -t "$pkgdir/usr/share/$_pkgname"
}
