# Maintainer: TingPing <tingping@tingping.se>

pkgname='tartan'
pkgver=0.2.0
pkgrel=1
pkgdesc='Clang analysis plugin for GLib and GNOME'
url='https://people.collabora.com/~pwith/gnome-clang/'
arch=('i686' 'x86_64')
license='GPL3'
depends=('llvm' 'clang' 'glib2' 'gobject-introspection')
source=("https://github.com/pwithnall/tartan/archive/$pkgver.tar.gz")
# Alt: https://git.collabora.com/git/tartan.git
sha256sums=('d73a0e4bda475498a69cbfc11d2e9b142b483d7a67f55b24642915e796c51115')

build() {
	cd "$srcdir/$pkgname"

	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"

	DESTDIR=$pkgdir make install
}
