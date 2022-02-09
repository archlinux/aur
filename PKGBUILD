pkgname=gtk2-libwinmenu
pkgver=1
pkgrel=2
pkgdesc="Gtk+ module to hide menubar by default"
arch=('i686' 'x86_64')
url='http://www.linux.org.ru/jump-message.jsp?msgid=5606544&cid=5617512'
license=('custom')
depends=('gtk2')
source=('libwinmenu.c' 'Makefile'
        use_ctrl_right.patch
        fix_gimp_whitelist.patch)
md5sums=('20a2e4823e8d2baf1e33de97335a040b' 'f90fd2c86b796a0c9d9e4a646539ec31'
         eb9d4660537a95689066f84b0563dbb9
         9ed28c17363baffb317566877f7c8315)
install='libwinmenu.install'

prepare() {
	cd "$srcdir"
	patch -Np1 --follow-symlinks -i use_ctrl_right.patch
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
