# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=bash-prompt-style
pkgname=$_pkgname-git
pkgver=r1.8cb9cb0
pkgrel=1
pkgdesc="A powerlevel10k-like prompt style of bash."
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname
license=(GPL3)
depends=(zsh-theme-powerlevel10k)
makedepends=(git)
source=("git+$url#tag=4a37921e91595069c7b088bb0e0a677bd9f65780")
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
