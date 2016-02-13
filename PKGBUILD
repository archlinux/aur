# Maintainer: Jakub Luzny (jakub@luzny.cz)
pkgname=nrf5x-command-line-tools
pkgver=8.2.0
pkgrel=1
pkgdesc="Tools for programming Nordic nRF51 MCU using J-Link"
arch=(i686 x86_64)
url="http://www.nordicsemi.com"
license=('unknown')
depends=('jlink-debugger')
provides=('nrfjprog')
conflicts=('nrfjprog')
options=()
source_i686=('nRF5x-Command-Line-Tools_8_2_0_Linux-i386.tar::https://www.nordicsemi.com/eng/nordic/download_resource/52615/4/68962942')
source_x86_64=('nRF5x-Command-Line-Tools_8_2_0_Linux-x86_64.tar::https://www.nordicsemi.com/eng/nordic/download_resource/51386/9/21471413')

md5sums_i686=('437f96c9e87b4676b3ef915ef39c84ba')
md5sums_x86_64=('498e7d2c6e7b4136318ce24f9102785a')

package() {
	mkdir -p "$pkgdir/opt/nrfjprog/"
	
        install -Dm755 "$srcdir/mergehex/mergehex" "$pkgdir/usr/bin/mergehex"
	
	cp "$srcdir/nrfjprog"/* "$pkgdir/opt/nrfjprog/"
	
	mkdir -p "$pkgdir/usr/bin"
	cd "$pkgdir/usr/bin"
	ln -s "../../opt/nrfjprog/nrfjprog" .
}
