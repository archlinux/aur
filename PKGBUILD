# Maintainer: Jakub Luzny (jakub@luzny.cz)
pkgname=nrfjprog
pkgver=7.7.0
pkgrel=1
pkgdesc="A tool for programming Nordic nRF51 MCU using J-Link"
arch=(x86_64)
url="http://www.nordicsemi.com"
license=('unknown')
depends=('jlink')
options=()
source=("NrfJProg_7_7_0_Linux.tar::https://www.nordicsemi.com/eng/nordic/download_resource/51392/3/37703953")
md5sums=('e642736f75f332b34673b52629413607')

package() {
	mkdir -p "$pkgdir/opt/nrfjprog/"
	
	cp "$srcdir"/* "$pkgdir/opt/nrfjprog/"
	
	rm "$pkgdir/opt/nrfjprog/NrfJProg_7_7_0_Linux.tar"
	
	mkdir -p "$pkgdir/usr/bin"
	cd "$pkgdir/usr/bin"
	ln -s "../../opt/nrfjprog/nrfjprog" .
	
	#Should be fixed in jlink package
	mkdir -p "$pkgdir/opt/SEGGER/JLink/"
	cd "$pkgdir/opt/SEGGER/JLink/"
	ln -s "/usr/lib/libjlinkarm.so"* .
}
