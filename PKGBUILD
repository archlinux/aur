# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=tellenc
pkgname="$_pkgname-git"
pkgver=r35.dac04c7
pkgrel=1
pkgdesc="A program to detect the encoding of a text file."
arch=(x86_64)
url=https://github.com/adah1972/tellenc
license=(zlib-acknowledgement)
source=("git+$url")
sha256sums=(SKIP)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	g++ "$_pkgname.cpp" -o"$_pkgname"
	install -D "$_pkgname" -t "$pkgdir/usr/bin"
}
