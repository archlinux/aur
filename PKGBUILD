# Maintainer: nomisge <nomisge @ live . de>
pkgname=microblocks
pkgver=1.1.16
pkgrel=1
pkgdesc="MicroBlocks is a blocks pogramming language for physical computing inspired by Scratch. It runs on microcontrollers such as the micro:bit, Calliope mini, AdaFruit Circuit Playground Express, and many others."
arch=('x86_64')
url="http://microblocks.fun"
license=('MPL2')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://microblocks.fun/downloads/v$pkgver/packages/ublocks-amd64.deb")
sha512sums=('17107c06251e1dcb7d69bc7733e4230f8df16d447f15dfb6775a059e8afeb173bfc491bda4bec50bd1692030a432a24ca5d1ea6812e64a45782e95911805fb02')


package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	sed -i s'#^Exec=/usr/local/bin/#Exec=/usr/bin/#g' "usr/share/applications/MicroBlocks.desktop"

	cd ..
}
