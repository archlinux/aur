# Maintainer: TingPing <tingping@tingping.se>

pkgname='tartan'
pkgver=0.3.0
pkgrel=1
pkgdesc='Clang analysis plugin for GLib and GNOME'
url='https://people.collabora.com/~pwith/gnome-clang/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('llvm' 'clang' 'glib2' 'gobject-introspection')
source=("https://www.freedesktop.org/software/tartan/releases/tartan-$pkgver.tar.xz")
# Alt: https://git.collabora.com/git/tartan.git
sha256sums=('008f8195de142900443f10d7a0a1e5a0360c1296e5684274fa39c148a161c731')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	DESTDIR=$pkgdir make install
}
