# Maintainer: nomisge <nomisge @ live . de>
pkgname=microblocks
pkgver=0.4.0
pkgrel=1
pkgdesc="MicroBlocks is a new programming language inspired by Scratch that runs inside microcontroller boards such as the micro:bit, the NodeMCU and many Arduino boards."
arch=('x86_64')
url="http://microblocks.fun"
license=('MPL2')
groups=('')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/bromagosa/microblocks-site/releases/download/v$pkgver/ublocks-amd64.deb")
sha512sums=('baaf46175f0f221f9e554b83062dc367941ca909ea9ecde97314c9ef4ba0c1aee89ed11095ce841bf1f130859dcca406822f8347b0ac7de2e1216dfebd81fc99')
package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	sed -i s'#^Exec=/usr/local/bin/#Exec=/usr/bin/#g' "usr/share/applications/MicroBlocks.desktop"

	cd ..
}
