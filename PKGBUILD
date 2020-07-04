# Maintainer: Duncan X Simpson <duncan@k7dxs.net>
# Contributor: Duncan X Simpson <duncan@k7dxs.net>
pkgname=pat-bin
pkgver=0.9.0
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
sha512sums_i686=('7de6e7f373ff0d7f9e8ac6d4476c1250f93fe1e58f900da16e43362b556ece5b680f390e11d87cd9f3d6aed38091beccbb0d03d509391547e61052f7cd08fceb')
sha512sums_x86_64=('20682e88b7f3f42e89d1b6ccdf7f1ffe08c97592f956a7091884a2d59d9ae6d83954a1fe8f195c126ec3ae483dc73b53f2de709eaeee742e5895c6dd910b6945')
sha512sums_armhf=('778fd57c84126cc061b29f26f53e8aeb310aa28e403fddf9c5b39209cf4911dab0482c48f74225b9af177bbe71c11007abaa06cb920cd449f22a2d9600226c73')


package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	cd ..

}
