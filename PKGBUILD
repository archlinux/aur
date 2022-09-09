# Maintainer:  Dessa Simpson <dxs@k7dxs.net>
# Contributor: Dessa Simpson <dxs@k7dxs.net>
pkgname=pat-bin
pkgver=0.13.0
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
sha512sums_i686=('ebb33d049810e6f2e84f26c6f7a5fc31ed74337e87329e4a9a9c88dacc2b232492c58029de06aa2ead107ac18dfdc534923b847a3a9c64e101ffa5473410bb36')
sha512sums_x86_64=('afb68bbc086bd97bbe3702178710463cb00107a3af033da69d782b5c9f4f18f9e6968f1cc3da2be59efe2c20789c838124fd77554ebb13da36f01565fc2fe2bc')
sha512sums_armhf=('49833ab57d043332a19d9bfd300c0e6b613f49ebce8551e0ebe9a529b96c4a728a02aae6400be38127285d772a8b65c3266b9d2ab4e4b72332eba5abc11d9b49')
sha512sums_armv6h=('49833ab57d043332a19d9bfd300c0e6b613f49ebce8551e0ebe9a529b96c4a728a02aae6400be38127285d772a8b65c3266b9d2ab4e4b72332eba5abc11d9b49')


package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	cd ..
}
