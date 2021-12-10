# Maintainer: Duncan X Simpson <duncan@k7dxs.net>
# Contributor: Duncan X Simpson <duncan@k7dxs.net>
pkgname=pat-bin
pkgver=0.12.0
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
sha512sums_i686=('0a516c46c1548c09a70a01b601028f1bcf1ac45c0372bac5ca23c5d91d729e0eca70aad0b6822d21416532bac92eacd89eb458b5195dbd246e450f47f29edc44')
sha512sums_x86_64=('b76c8bd055e2cb6ebf37c8d53a60c25eab8ebb5f719c43ad031419330f5c66e8d456224ece540295813ce1fb08513292b6dc4e5d8bf00811b936e54116045334')
sha512sums_armhf=('668f3f860bcf3ff8ae46d3b9d35b448bbfe73699397b410b76b78123f7300797b0ca660a35151740ccd43ed1a9daf660a04d1baa78051adbb17efdeb2f117073')
sha512sums_armv6h=('668f3f860bcf3ff8ae46d3b9d35b448bbfe73699397b410b76b78123f7300797b0ca660a35151740ccd43ed1a9daf660a04d1baa78051adbb17efdeb2f117073')


package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	cd ..

}
