# Maintainer: Martin Dørum <martid0311@gmail.com>
_gitname=mauncher
pkgname="$_gitname-git"
pkgver=r14.cc224e2
pkgrel=1
pkgdesc="A dmenu-like launcher for Wayland."
arch=('i686' 'x86_64')
url="https://github.com/mortie/$_gitname"
license=('GPL')
depends=('gtk3' 'gobject-introspection')
makedepends=('git' 'meson' 'ninja' 'make')
provides=('mauncher')
source=("git+https://github.com/mortie/$_gitname.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	make
}

package() {
	cd "$srcdir/$_gitname"
	DESTDIR="$pkgdir" PREFIX=/usr make install
}
