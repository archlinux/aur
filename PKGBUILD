# Maintainer: nomisge <nomisge @ live . de>
pkgname=microblocks
pkgver=2.0.88
pkgrel=1
pkgdesc="MicroBlocks is a free, blocks pogramming language for learning physical computing with educational microcontroller boards such as the micro:bit, Adafruit Circuit Playground Express, and many others."
arch=('x86_64')
url="http://microblocks.fun"
license=('MPL2')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${pkgname}-${pkgver}-amd64.deb::https://microblocks.fun/downloads/v$pkgver/packages/ublocks-amd64.deb")
sha512sums=('e9a4f526b59e25fc3ffd645d1ecd607d8b5a73a25d966c8c9554a7e82ef0859e0b7662db9c229cf4d217a3a49973a1fd4afc7cff9a3c863c7813abf30a7a5cd8')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	sed -i s'#^Exec=/usr/local/bin/#Exec=/usr/bin/#g' "usr/share/applications/MicroBlocks.desktop"

	cd ..
}
