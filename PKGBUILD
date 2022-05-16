# Maintainer: Victor de Jong <victor@victordejong.com>
pkgname=openvpn-nl
pkgver=2.4.12
pkgrel=1
pkgdesc="An open-source fork of OpenVPN allowed to be used in classified environments up to (equivalent) NATO RESTRICTED"
arch=('any')
url="https://openvpn.fox-it.com/"
license=('GPL2')
depends=('lzo' 'lz4')
makedepends=('cmake')
provides=('openvpn')
source=("https://openvpn.fox-it.com/repos/source/$pkgver/$pkgname-src-$pkgver.tar.gz")
sha512sums=('5e13c53750894a74837f4fe546eaf205fa18c618c03cbc5b79e9ac5b4b11b14f50995d7629136d02a9cb11c094b5cf9139d94f944dd19847b75bcbe61d007532')
validpgpkeys=('6A1195968DDCA3494E7C598C43CF15D354E03E30')

package() {
	cd "$pkgname"
	./build-openvpn-nl.sh
	mkdir -p $pkgdir/usr/bin
	cp build-openvpn-nl/src/openvpn/openvpn $pkgdir/usr/bin/openvpn-nl
}
