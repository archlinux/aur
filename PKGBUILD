# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=gdb-prompt
pkgname=$_pkgname-git
pkgver=r8.b837d39
pkgrel=1
pkgdesc="A powerlevel10k-like prompt style of gdb."
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname
license=(GPL3)
depends=(gdb)
makedepends=(git)
source=("git+$url#tag=b837d39b40c5f9cf4bacff547d2c9e35ddfcc80e")
sha256sums=(SKIP)

pkgver() {
	cd "$_pkgname" || return 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname" || return 1

	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	install -D gdb-prompt -t "$pkgdir/usr/bin"
}
