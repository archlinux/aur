# Maintainer: nomisge <nomisge @ live . de>
pkgname=microblocks
pkgver=2.0.64
pkgrel=1
pkgdesc="MicroBlocks is a free, blocks pogramming language for learning physical computing with educational microcontroller boards such as the micro:bit, Adafruit Circuit Playground Express, and many others."
arch=('x86_64')
url="http://microblocks.fun"
license=('MPL2')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${pkgname}-${pkgver}-amd64.deb::https://microblocks.fun/downloads/v$pkgver/packages/ublocks-amd64.deb")
sha512sums=('a93f4e9a5715dd1bc54752554f0d1b45a649bf05bdd00be9d84790ac9e4a7e5d5e1083982456ec52dfddcb215fdf22f3408a94bd7b361ad37f1aaad19205be7d')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	sed -i s'#^Exec=/usr/local/bin/#Exec=/usr/bin/#g' "usr/share/applications/MicroBlocks.desktop"

	cd ..
}
