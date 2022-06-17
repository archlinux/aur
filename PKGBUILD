# Maintainer: <abishekj274@gmail.com>
pkgname=peer2profit
pkgver=0.47
pkgrel=1
pkgdesc='An app to sell your unused bandwidth'
arch=('x86_64')
url="https://peer2profit.io/"
license=("custom:EULA")
source=("https://updates.peer2profit.app/peer2profit_${pkgver}_amd64.deb" "https://peer2profit.io/user-agreement")
sha256sums=('129a6135b0df4e3c42682214429520cdc050607ff42f56758788053cdb45eb55'
            '85b4708859c5736274802c52610900ae2d441a7f7772982d2a7ef653df32b3ce')
depends=("libglvnd" "hicolor-icon-theme"
	 "xcb-util-keysyms" "xcb-util-wm" "xcb-util-renderutil"
	 "libxkbcommon-x11" "xcb-util-image")

package(){
	cd $srcdir
	tar xpf data.tar.xz -C $pkgdir
	chmod -R 755 "$pkgdir/usr"
	install -Dm644 "$srcdir/user-agreement" "$pkgdir/usr/share/licenses/$pkgname/user-agreement.html"
	rm -rf "$pkgdir/usr/local"
}
