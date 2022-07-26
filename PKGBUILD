# Maintainer:  Dessa Simpson <dxs@k7dxs.net>
# Contributor: Dessa Simpson <dxs@k7dxs.net>
pkgname=pat-bin
pkgver=0.12.1
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
sha512sums_i686=('ca6b472f480171db561f9a2bbf58de5b5a6f5aae083518acb349219ece38095f8c01406ab328921149cf71d2e94784a792e26f29c519351432a3504a4335c1e3')
sha512sums_x86_64=('804a28f4808b0a545bf6ecd1c89f86b408f4f1105c0839f95718d73a33387fa2b5916d3cc51ee5aeaa16f603d328d5c69f6273b092235a67c51a234b81d419c1')
sha512sums_armhf=('87c9941a6c0344a5d89ed32e8fe4af0b66d8acb8eb4510ffc796dbd1fc738bad8dfa33ac8c73cc0fd736ffedeabdfe459483d4407e20ca6ebbd9df3a328f6d5c')
sha512sums_armv6h=('87c9941a6c0344a5d89ed32e8fe4af0b66d8acb8eb4510ffc796dbd1fc738bad8dfa33ac8c73cc0fd736ffedeabdfe459483d4407e20ca6ebbd9df3a328f6d5c')


package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	cd ..
}
