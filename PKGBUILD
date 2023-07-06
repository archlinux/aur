# Maintainer: nomisge <nomisge @ live . de>
pkgname=microblocks
pkgver=1.2.24
pkgrel=1
pkgdesc="MicroBlocks is a free, blocks pogramming language for learning physical computing with educational microcontroller boards such as the micro:bit, Calliope mini, AdaFruit Circuit Playground Express, and many others."
arch=('x86_64')
url="http://microblocks.fun"
license=('MPL2')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://microblocks.fun/downloads/v$pkgver/packages/ublocks-amd64.deb")
sha512sums=('9ddd9903ddb0e6fd0fcad36894454994c12a92497165a10f12432d531cdca487dd4ba345db14b0699de51dba3f5b2fc0c5e885793f52d1dd62608450a6dbca2e')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	sed -i s'#^Exec=/usr/local/bin/#Exec=/usr/bin/#g' "usr/share/applications/MicroBlocks.desktop"

	cd ..
}
