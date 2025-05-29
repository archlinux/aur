# Maintainer:  Dessa Simpson <dxs@k7dxs.net>
# Contributor: Dessa Simpson <dxs@k7dxs.net>
pkgname=pat-bin
pkgver=0.17.0
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
sha512sums_i686=('5faa36e299e1a1b5d0e848256260e78411dacbf752f4ad65769936cc64d016b6254ccd868b573d7ad48ca484443795cfcf9c446e70b274411cbd393f6183b6ec')
sha512sums_x86_64=('a971be876e7501b680c63a092f4b25df8ccd02f6a859d2d1eca1c7df2bb505d100a7c9acc5a5f3d172b968b0d3a4ec73aaaf723809c454f802b9023f6abc29fc')
sha512sums_armhf=('44379f4dcea51d245cba129b68cd8a6d2d394463c8fe33bfc70371690f802198c73c170f1dde0912c7ec291a6abf8fd855616065d2b8f6041dd2fea84e467de7')
sha512sums_armv6h=('44379f4dcea51d245cba129b68cd8a6d2d394463c8fe33bfc70371690f802198c73c170f1dde0912c7ec291a6abf8fd855616065d2b8f6041dd2fea84e467de7')

package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	cd ..
}
