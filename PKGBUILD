# Maintainer: thr <r at sledinmay dot com>
pkgname=kiba-dock-bin
pkgver=0.1
pkgrel=4
pkgdesc="An eyecandy'd physics-based application launcher. (binary version)"
arch=(i686 x86_64)
url="https://launchpad.net/kiba-dock"
license=(GPL)
depends_i686=('gconf' 'gtk-update-icon-cache' 'orbit2' 'librsvg' 'libglade' 'glitz' 'libcanberra')
depends_x86_64=('lib32-gconf' 'gtk-update-icon-cache' 'lib32-orbit2' 'lib32-librsvg' 'lib32-libglade' 'lib32-glitz' 'lib32-libcanberra')
source=("https://web.archive.org/web/20100615170245/http://cesarius.net/wp-content/uploads/kiba-dock_0.1-1.2_i386.deb")
install=kiba-dock-bin.install
md5sums=('2c39a4062dccf7cbe16351ef392ce622')

prepare() {
	tar -zxf data.tar.gz
	rm usr/bin/populate-dock.sh
	rm usr/bin/kiba-systray.py
	rm usr/bin/kiba-icon-editor.py
	mv usr/lib/python2.4 usr/lib/python2.7
	ln -s /usr/share/icons/hicolor/16x16/apps/kiba_16.png usr/share/kiba-dock/kiba_16.png
}
package() {
	cp -rf usr ${pkgdir}
}
