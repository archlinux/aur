pkgname=gtk3-libwinmenu
pkgver=1
pkgrel=1
pkgdesc="Gtk+ module to hide menubar by default"
arch=('i686' 'x86_64')
url='http://www.linux.org.ru/jump-message.jsp?msgid=5606544&cid=5617512'
license=('custom')
depends=('gtk3')
source=('libwinmenu.c' 'Makefile'
        use_alt_left.patch
        update_to_gtk3.patch)
md5sums=('20a2e4823e8d2baf1e33de97335a040b' 'f90fd2c86b796a0c9d9e4a646539ec31'
         d43683a6001d8032881f95ccf8dda5f4
         f2bc0a86ed0d394a6e6725fc26010b44)
install='libwinmenu.install'

prepare() {
	cd "$srcdir"
	patch -Np1 --follow-symlinks -i use_alt_left.patch
	patch -Np1 --follow-symlinks -i update_to_gtk3.patch
}

build() {
	cd "$srcdir"
	make
}

package() {
	cd "$srcdir"
	install -Dm755 libwinmenu.so "$pkgdir/usr/lib/gtk-3.0/modules/libwinmenu.so"
}
