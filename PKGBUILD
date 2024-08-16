pkgname=gtk2-libwinmenu
pkgver=1
pkgrel=3
pkgdesc="Gtk+ module to hide menubar by default"
arch=('i686' 'x86_64')
url='http://www.linux.org.ru/jump-message.jsp?msgid=5606544&cid=5617512'
license=('custom')
depends=('gtk2')
source=('libwinmenu.c' 'Makefile'
        use_ctrl_right.patch
        fix_gimp_whitelist.patch)
md5sums=('20a2e4823e8d2baf1e33de97335a040b' 'bea7864ffb1fe89ed61160b31b58f528'
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
