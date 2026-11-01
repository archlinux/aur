# Maintainer:  Dessa Simpson <dxs@k7dxs.net>
# Contributor: Dessa Simpson <dxs@k7dxs.net>
pkgname=pat-bin
pkgver=1.0.1
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
sha512sums_i686=('c2c76c5237ad09070d75c95a9414165c543305b524e00c655d1ecb4622ae296251e40b1a39bd7e3d16f82c8ab4cc880a6ecae641e6f410b8cf46947e01dac487')
sha512sums_x86_64=('8904b2dbbd506fc343284c27279c3250d6759e482c50700d4abb6db8226fa6ea4461c8cee0093034d7812882853ddb4acc90695a495a12da8296a36983ca1b61')
sha512sums_armhf=('a62bce5f818114ccc7d735facd3fbd805f9f3030cdd5498e4a7e2836c00a29f671e5ab9b413a1b0a36313d35e976929b71f19fa8b83293c40e3f941b8c0a60fe')
sha512sums_armv6h=('a62bce5f818114ccc7d735facd3fbd805f9f3030cdd5498e4a7e2836c00a29f671e5ab9b413a1b0a36313d35e976929b71f19fa8b83293c40e3f941b8c0a60fe')

package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	cd ..
}
