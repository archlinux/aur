# Maintainer:  Dessa Simpson <dxs@k7dxs.net>
# Contributor: Dessa Simpson <dxs@k7dxs.net>
pkgname=pat-bin
pkgver=0.13.1
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
sha512sums_i686=('4d45bdb6ef794d1d6fd4ba097b25b119dfeb91e82af0f1d9894918a421f57e0ae399c962d6e35a26745d7114f2c033379f01a089ceda7c4139a33ebab0156df7')
sha512sums_x86_64=('1c347d12f643affefa9900f9d9863f3220c887541785d3212abcaabc11b477d15589c1053bd773bc096479c05cc9c0382ba628e4d2a3de9da6967614ff3feba4')
sha512sums_armhf=('a1a325be20893488f6f0c41594f0b38dd643d8a15c874d88746f7153bd39acaac840e75d3cdc2463d8e6859813a91a9f6f2a62cb88f2799a52d09e27711acd22')
sha512sums_armv6h=('a1a325be20893488f6f0c41594f0b38dd643d8a15c874d88746f7153bd39acaac840e75d3cdc2463d8e6859813a91a9f6f2a62cb88f2799a52d09e27711acd22')


package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	cd ..
}
