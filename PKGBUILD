# Maintainer: gfrank227 [at] gmail [dot] com
pkgname=nordvpn-gui
pkgver=2.0.0
pkgrel=2
arch=('x86_64')
pkgdesc='GUI for NordVPN'
url='https://nordvpn.com'
license=('Proprietary')
depends=('nordvpn' 'gtk3')
options=('!debug')
install=daemon_restart.install
source=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn-gui/nordvpn-gui_${pkgver}_amd64.deb"
		"daemon_restart.install")
sha256sums=('fc602c4eca3c3eca81b546f5fdf14efec6e8614b80d4c94bc85432f6a7dfbe06'
            'b3bc3b4519769cc9c78258b16eb44765ddd8168951997d8bafdc7b8fcb73d868')
prepare() {
	ar xv nordvpn-gui_${pkgver}_amd64.deb
	tar -xvzf data.tar.gz
}
package() {
	cp -rf $srcdir/opt $pkgdir/opt
	cp -rf $srcdir/usr $pkgdir/usr
	install -dm755 $pkgdir/usr/bin
	ln -s /opt/nordvpn-gui/nordvpn-gui $pkgdir/usr/bin/nordvpn-gui 
}
