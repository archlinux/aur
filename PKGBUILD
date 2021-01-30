# Maintainer: nomisge <nomisge @ live . de>
pkgname=microblocks
pkgver=1.0.10
pkgrel=1
pkgdesc="MicroBlocks is a blocks pogramming language for physical computing inspired by Scratch. It runs on microcontrollers such as the micro:bit, Calliope mini, AdaFruit Circuit Playground Express, and many others."
arch=('x86_64')
url="http://microblocks.fun"
license=('MPL2')
groups=('')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://microblocks.fun/downloads/v$pkgver/packages/ublocks-amd64.deb")
sha512sums=('a7250d3b602ca114c241b8dea3777cbba19beae5af0cb320896c522d6c1c14343f395dad05f92130f656ce14e4cb61faad7a078134d82e1af898c6a7972296ee')
package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	sed -i s'#^Exec=/usr/local/bin/#Exec=/usr/bin/#g' "usr/share/applications/MicroBlocks.desktop"

	cd ..
}
