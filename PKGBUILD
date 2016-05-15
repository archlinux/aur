# Maintainer: Your Name <max at maxbruckner dot de>
pkgname=gtk-vector-screenshot
pkgver=0.3.2.1.2
pkgrel=2
epoch=
pkgdesc="A GTK module for taking vector graphic screenshots (PDF, SVG and PostScript)"
arch=("i686" "x86_64")
url="https://github.com/nomeata/gtk-vector-screenshot"
license=('LGPL2.1')
depends=("gtk2" "gtk3" "xorg-server")
makedepends=("git")
source=("git+https://github.com/nomeata/gtk-vector-screenshot#commit=4d5addb")
sha512sums=('SKIP')

prepare() {
	cd "$pkgname"
	autoreconf -vif
}

build() {
	cd "$pkgname"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
	install -D 52load-gtk-vector-screenshot-gtk-module "$pkgdir/etc/X11/xinit/xinitrc.d/52load-gtk-vector-screenshot-gtk-module"
}
