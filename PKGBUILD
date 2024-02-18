# Maintainer: nomisge <nomisge @ live . de>
pkgname=microblocks
pkgver=1.2.46
pkgrel=1
pkgdesc="MicroBlocks is a free, blocks pogramming language for learning physical computing with educational microcontroller boards such as the micro:bit, Calliope mini, AdaFruit Circuit Playground Express, and many others."
arch=('x86_64')
url="http://microblocks.fun"
license=('MPL2')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://microblocks.fun/downloads/v$pkgver/packages/ublocks-amd64.deb")
sha512sums=('eda3d0757a5a6bd7d38122fa0749fd2e3c7743ccc7be99565e0d8a116293c0ea2bdc95541cd6fa89743f1d3f75b6d1a4462d384c4fee86b0573f14e57441fefa')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	sed -i s'#^Exec=/usr/local/bin/#Exec=/usr/bin/#g' "usr/share/applications/MicroBlocks.desktop"

	cd ..
}
