# Maintainer: Victor A. Santos  <victoraur.santos@gmail.com>
pkgname=valadoc-git
pkgver=r594.b02b806
pkgrel=1
pkgdesc="Valadoc is a documentation generator for generating API documentation from Vala source code based on libvala."
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/Valadoc"
license=('GPL3')
depends=('vala' 'graphviz' 'libgee')
conflicts=('valadoc')
provides=('valadoc')
source=("$pkgname::git://git.gnome.org/valadoc")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"

    ./autogen.sh
    ./configure --prefix=/usr
}

package() {
	cd "$srcdir/${pkgname}"

    make DESTDIR=$pkgdir install
}
