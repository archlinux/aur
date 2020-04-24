# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=gnome-breakout-bin
_pkgname=gnome-breakout
pkgver=0.5.3
pkgrel=1
pkgdesc="Clone of the classic game Breakout, written for GNOME"
arch=('x86_64')
url="http://www.users.on.net/~mipearson/"
license=('GPL3')
depends=('goocanvas' 'libgnome-games-support' 'gtk3' 'gdk-pixbuf2' 'cairo')
source=(gnome-breakout.deb::"http://http.us.debian.org/debian/pool/main/g/${_pkgname}/${_pkgname}_${pkgver}-7_amd64.deb")
sha256sums=('d4b3013cd99c6585ce617989e4339aadf578fd10bc56b6b1c90b89d4acd39a35')
package() {
	tar -xvf ${srcdir}/data.tar.xz -C ${pkgdir}/	
	mkdir ${pkgdir}/usr/bin
	mv ${pkgdir}/usr/games/gnome-breakout ${pkgdir}/usr/bin
	rmdir ${pkgdir}/usr/games
	install -Dm 644 ${pkgdir}/usr/share/pixmaps/gnome-breakout.png ${pkgdir}/usr/share/icons/hicolor/48x48/gnome-breakout.png
	sed -i 's/Icon=gnome-breakout.png/Icon=gnome-breakout/g' ${pkgdir}/usr/share/applications/gnome-breakout.desktop
}
