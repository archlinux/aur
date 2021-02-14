# Maintainer: nomisge <nomisge @ live . de>
pkgname=microblocks
pkgver=1.0.11
pkgrel=1
pkgdesc="MicroBlocks is a blocks pogramming language for physical computing inspired by Scratch. It runs on microcontrollers such as the micro:bit, Calliope mini, AdaFruit Circuit Playground Express, and many others."
arch=('x86_64')
url="http://microblocks.fun"
license=('MPL2')
groups=('')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://microblocks.fun/downloads/v$pkgver/packages/ublocks-amd64.deb")
sha512sums=('aaf4ed9bb515e5edfb0f72d5b1c9a2b0a98333406617a32dd4141e3a4bcaaa15498e3cc0c391e3f7263f2e7b5f976d370a808047b3df12c7e792a0b15a0024a8')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	sed -i s'#^Exec=/usr/local/bin/#Exec=/usr/bin/#g' "usr/share/applications/MicroBlocks.desktop"

	cd ..
}
