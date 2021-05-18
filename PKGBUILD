# Maintainer: nomisge <nomisge @ live . de>
pkgname=microblocks
pkgver=1.0.14
pkgrel=1
pkgdesc="MicroBlocks is a blocks pogramming language for physical computing inspired by Scratch. It runs on microcontrollers such as the micro:bit, Calliope mini, AdaFruit Circuit Playground Express, and many others."
arch=('x86_64')
url="http://microblocks.fun"
license=('MPL2')
groups=('')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://microblocks.fun/downloads/v$pkgver/packages/ublocks-amd64.deb")
sha512sums=('9ed526fa278319efa0ee3841d5a4dcf0a4dc9547f2ec22511c371f6f82bbadc8416f535f2c74d8b2530f7bfa7a9e57b97eb73a3de45169d25f2d835d6c889375')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	sed -i s'#^Exec=/usr/local/bin/#Exec=/usr/bin/#g' "usr/share/applications/MicroBlocks.desktop"

	cd ..
}
