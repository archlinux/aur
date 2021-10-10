#Maintainer: Bazza <bazza@riseup.net>

pkgname=('rhubarb-lip-sync')
pkgver=1.11.0
pkgrel=1
pkgdesc="Rhubarb Lip Sync is a command-line tool that automatically creates 2D mouth animation from voice recordings."
provides=("DanielSWolf")
makedepends=('cmake' 'boost-libs')
url='https://github.com/DanielSWolf/rhubarb-lip-sync'
arch=('x86_64')
source=("v${pkgver}.zip::https://codeload.github.com/DanielSWolf/rhubarb-lip-sync/zip/refs/heads/master")
md5sums=('SKIP')
license=('MIT')
options=(!strip)

prepare(){
	pwd
	cd ${pkgname}-master #${pkgver}
	pwd
	mkdir build
	cd build
	cmake ..
	make rhubarb
}

package(){
	mkdir -p "${pkgdir}"/usr/bin/
	cp "${srcdir}"/${pkgname}-master/build/rhubarb/rhubarb "${pkgdir}"/usr/bin/
	chmod 755 "${pkgdir}"/usr/bin/rhubarb
}
