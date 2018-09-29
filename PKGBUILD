# Maintainer: Duncan X Simpson <duncan@k7dxs.net>
# Contributor: Duncan X Simpson <duncan@k7dxs.net>
pkgname=pat-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A modern Winlink client"
arch=('i686' 'x86_64' 'armhf')
url="http://getpat.io"
license=('MIT')
groups=('')
provides=('pat')
conflicts=('pat')
optdepends=('gpsd>=2.90'
            'hamlib>=1.2'
            'ncurses')
options=('!strip' '!emptydirs')
source_i686=("https://github.com/la5nta/pat/releases/download/v${pkgver}/pat_${pkgver}_linux_i386.deb")
source_x86_64=("https://github.com/la5nta/pat/releases/download/v${pkgver}/pat_${pkgver}_linux_amd64.deb")
source_armhf=("https://github.com/la5nta/pat/releases/download/v${pkgver}/pat_${pkgver}_linux_armhf.deb")
sha512sums_i686=('3991c043f13db60da03a9f11e231a0d842e864539c0fd1336b68aa46d05fcc04e55891da99cc4ffd7bfb1f51c1e0f9f383e0912634a8f52cc84cbd5281da0d22')
sha512sums_x86_64=('0047f2c686a1bae00ea013699cf448f1c420906ab6b3a62ddb5148f98098ef65fa8164fe940bc3805e98b96a1ea0a58affffe9d5a0cddbe375c686556ce5c533')
sha512sums_armhf=('5bb062d2cacb40bbb9ad039503314365612b645cecff4ad4880360af203cbe46ebaf1063af5ba664675a810994ad16445ce4e498b0060c987995ed73d1d2ee94')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	cd ..

}
