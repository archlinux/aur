#Maintainer: Bazza <bazza@riseup.net>

pkgname=('rhubarb-lip-sync')
pkgver=1.11.0
pkgrel=1
pkgdesc="Rhubarb Lip Sync is a command-line tool that automatically creates 2D mouth animation from voice recordings."
provides=("DanielSWolf")
makedepends=('cmake' 'boost-libs')
url='https://github.com/DanielSWolf/rhubarb-lip-sync'
arch=('x86_64')
source=("v${pkgver}.zip::https://github.com/DanielSWolf/rhubarb-lip-sync/archive/refs/tags/v1.11.0.zip")
md5sums=('477b02584277e4e0cb3d5abe4c45fc83')
license=('MIT')
options=(!strip)

prepare(){
	pwd
	cd ${pkgname}-${pkgver}
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
