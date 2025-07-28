# Maintainer: nomisge <nomisge @ live . de>
pkgname=microblocks
pkgver=2.0.60
pkgrel=1
pkgdesc="MicroBlocks is a free, blocks pogramming language for learning physical computing with educational microcontroller boards such as the micro:bit, Adafruit Circuit Playground Express, and many others."
arch=('x86_64')
url="http://microblocks.fun"
license=('MPL2')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${pkgname}-${pkgver}-amd64.deb::https://microblocks.fun/downloads/v$pkgver/packages/ublocks-amd64.deb")
sha512sums=('eb944536bb1dc9375069c4ea99d7e8b5d7926d768e7ac2e8709ddaa78fdf1ad5a8ca3288b005b813fd77011ffa8c7b65d0889c85b33ff1a2a9270906d3670f68')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	sed -i s'#^Exec=/usr/local/bin/#Exec=/usr/bin/#g' "usr/share/applications/MicroBlocks.desktop"

	cd ..
}
