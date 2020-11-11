# Maintainer: Duncan X Simpson <duncan@k7dxs.net>
# Contributor: Duncan X Simpson <duncan@k7dxs.net>
pkgname=pat-bin
pkgver=0.10.0
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
sha512sums_i686=('07775922b1362ccbd3eb1d638bfddc5456e98ea5365e9ce6f9dd7650439145e30b8bc5e030b49d9962e3b390c219ceba104320726f5270c8d7134268c4e2b874')
sha512sums_x86_64=('0b66198edc1299bde446c7d1f2cdcdc1bce28f470e9b7a6caaa9bb28965a21bc198bfe8243cdbc69570aec852eac0d588e941165fedf45cf1cdc5272774866ac')
sha512sums_armhf=('4b2f37a9fc5ddcb0dc5bbfdf342da4d5a1e3e60b131813a5267d09d49f217b8c856df47c8a674f56cc8e3116f186fa61a3e5e1ea037f93998c27cd21615e0af8')


package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	cd ..

}
