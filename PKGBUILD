# Maintainer: Armin Luntzer <armin.luntzer@univie.ac.at>
pkgname=gtknodes-git
_pkgname=gtknodes
pkgver=0.1
pkgrel=5
epoch=
pkgdesc="A GTK-based library to create functional flow graphs with the ability to pass arbitrary data between connected elements."
arch=('x86_64')
url="https://github.com/aluntzer/$_pkgname"
license=('LGPL')
depends=('gtk3')
makedepends=('git' 'gobject-introspection' 'gtk-doc' 'vala')
source=("git://github.com/aluntzer/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	git describe | sed 's/^v//;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	./autogen.sh
	./configure --prefix=/usr
}

build() {
	cd "$_pkgname"

	make
}

check() {
	cd "$_pkgname"

	make check
}

package() {
	cd "$_pkgname"

	make install PREFIX=/usr DESTDIR="$pkgdir"
}

