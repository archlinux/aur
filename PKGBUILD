# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=auto-sized-fzf
pkgname=$_pkgname-git
pkgver=r3.45b5121
pkgrel=2
pkgdesc="A --preview=.... generator that is based on the shell's current dimensions."
arch=(any)
url=https://github.com/bigH/$_pkgname
depends=(bc)
optdepends=(fzf)
license=(GPL3)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname" || return 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname" || return 1

	install -D "$_pkgname.sh" -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
