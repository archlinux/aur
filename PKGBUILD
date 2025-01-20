# Maintainer:  Dessa Simpson <dxs@k7dxs.net>
# Contributor: Dessa Simpson <dxs@k7dxs.net>
pkgname=pat-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="A modern Winlink client"
arch=('i686' 'x86_64' 'armhf' 'armv6h')
url="http://getpat.io"
license=('MIT')
provides=('pat')
conflicts=('pat')
optdepends=('gpsd>=2.90'
            'hamlib>=1.2'
            'ncurses')
options=('!strip' '!emptydirs')
source_i686=("https://github.com/la5nta/pat/releases/download/v${pkgver}/pat_${pkgver}_linux_i386.deb")
source_x86_64=("https://github.com/la5nta/pat/releases/download/v${pkgver}/pat_${pkgver}_linux_amd64.deb")
source_armhf=("https://github.com/la5nta/pat/releases/download/v${pkgver}/pat_${pkgver}_linux_armhf.deb")
source_armv6h=("https://github.com/la5nta/pat/releases/download/v${pkgver}/pat_${pkgver}_linux_armhf.deb")
sha512sums_i686=('40552a059de446ff6fa5de18b43553db1e4bbccd9436fd7d77b09ef0a678af57ba2c128e36242ef7f3839f8e21443b96e0a9a532e1dedece8a88d4340c3eb8d7')
sha512sums_x86_64=('9534ae967b8994325f281efdff73dc44305d5993e92b382c4ec1f48c2ae0931f9e38b8a1f1b5df071bfc9e0dc6a2f24dfe6403e9e8b3ebf1c88507c1cc44cabe')
sha512sums_armhf=('56b4bd2b0783a76ffbad2b1faa7839044e67cfc94fb8e61922480d2419d3fc84a66c6c0e9987feab0d355cfa1200528d3a7d7768a4ae57c24d320ef1b09f67ca')
sha512sums_armv6h=('56b4bd2b0783a76ffbad2b1faa7839044e67cfc94fb8e61922480d2419d3fc84a66c6c0e9987feab0d355cfa1200528d3a7d7768a4ae57c24d320ef1b09f67ca')


package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	cd ..
}
