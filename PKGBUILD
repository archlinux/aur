#Maintainer: Bazza <bazza@riseup.net>

pkgname=('rhubarb-lip-sync')
pkgver=1.12.0
pkgrel=1
pkgdesc="Rhubarb Lip Sync is a command-line tool that automatically creates 2D mouth animation from voice recordings."
provides=("DanielSWolf")
makedepends=('cmake' 'boost-libs')
url='https://github.com/DanielSWolf/rhubarb-lip-sync'
arch=('x86_64')
source=("v${pkgver}.zip::https://github.com/DanielSWolf/rhubarb-lip-sync/releases/download/v1.12.0/Rhubarb-Lip-Sync-1.12.0-Linux.zip")

md5sums=('f823c9b3abdf632eb49f68c3970c724b')
license=('MIT')
options=(!strip)

prepare(){
	pwd
	cd ${pkgname}-* #${pkgver}
	pwd
	mkdir build
	cd build
	cmake ..
	make rhubarb
}

package(){
	mkdir -p "${pkgdir}"/usr/bin/
	cp "${srcdir}"/${pkgname}-*/build/rhubarb/rhubarb "${pkgdir}"/usr/bin/
	chmod 755 "${pkgdir}"/usr/bin/rhubarb
}
