pkgname=gtk2-libwinmenu
pkgver=1
pkgrel=1
pkgdesc="Gtk+ module to hide menubar by default"
arch=('i686' 'x86_64')
url='http://www.linux.org.ru/jump-message.jsp?msgid=5606544&cid=5617512'
license=('custom')
depends=('gtk2')
source=('libwinmenu.c' 'Makefile'
        use_alt_left.patch
        fix_gimp_whitelist.patch)
md5sums=('20a2e4823e8d2baf1e33de97335a040b' 'f90fd2c86b796a0c9d9e4a646539ec31'
         d43683a6001d8032881f95ccf8dda5f4
         9ed28c17363baffb317566877f7c8315)
install='libwinmenu.install'

prepare() {
	cd "$srcdir"
	patch -Np1 --follow-symlinks -i use_alt_left.patch
	patch -Np1 --follow-symlinks -i fix_gimp_whitelist.patch
}

build() {
	cd "$srcdir"
	make
}

package() {
	cd "$srcdir"
	install -Dm755 libwinmenu.so "$pkgdir/usr/lib/gtk-2.0/modules/libwinmenu.so"
}
