# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=gdb-prompt
pkgname=$_pkgname-git
pkgver=r1.db4e896
pkgrel=1
pkgdesc="A powerlevel10k-like prompt style of gdb."
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname
license=(GPL3)
depends=(gdb)
makedepends=(git)
source=("git+$url#tag=db4e8965a1a9624a142d84e6c81e13a0057433a8")
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
