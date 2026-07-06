# Maintainer: Joel Eapen <joelpeapen@gmail.com>
pkgname='pickle-git'
_pkgname='pickle'
pkgver=r22.8106f74
pkgrel=1
pkgdesc="TUI colorpicker"
arch=("x86_64")
license=('GPL-3.0')
makedepends=('git')
depends=('glibc' 'ncurses')
url="https://codeberg.org/j_ole/$_pkgname"
source=("$_pkgname::git+https://codeberg.org/j_ole/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	make install DESTDIR="$pkgdir"
}
