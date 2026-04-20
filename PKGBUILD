# Maintainer:  Dessa Simpson <dxs@k7dxs.net>
# Contributor: Dessa Simpson <dxs@k7dxs.net>
pkgname=pat-bin
pkgver=1.0.0
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
sha512sums_i686=('e65d72b639565778a31974765f39fe29157669c5a870f09fb0c54b01ed053673c8a8bad7a447b23e97d34f90480c824b1ecf5d90646fb8914ad4cd7bdfb7abb1')
sha512sums_x86_64=('4963afdb1f382ef06a29c5ea927059a4e6433594812492abbefa1453d2a938e4bedd2c4b7796c500ea2de13fdfa8794fd62951f51b90a11b8ac19ab2fcfaeef5')
sha512sums_armhf=('95352b4b5aa8f7ccc8721047c78633a521989c982eb604095dd983ae6e5b4105ff736e36d2e93d4d6da14b8095615fc93ea1a5ff412ab828a519bc361a4de412')
sha512sums_armv6h=('95352b4b5aa8f7ccc8721047c78633a521989c982eb604095dd983ae6e5b4105ff736e36d2e93d4d6da14b8095615fc93ea1a5ff412ab828a519bc361a4de412')

package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	cd ..
}
