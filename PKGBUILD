#Maintainer: Bazza <bazza@riseup.net>

pkgname=('rhubarb-lip-sync')
pkgver=1.12.0
pkgrel=1
pkgdesc="Rhubarb Lip Sync is a command-line tool that automatically creates 2D mouth animation from voice recordings."
provides=("DanielSWolf")
makedepends=('cmake' 'boost-libs' 'boost' )
url='https://github.com/DanielSWolf/rhubarb-lip-sync'
arch=('x86_64')
source=("v${pkgver}.zip::https://github.com/DanielSWolf/rhubarb-lip-sync/archive/refs/tags/v1.12.0.zip")
md5sums=('c67614d53433d08164f4610ddc9a39a0')
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
	cp "${srcdir}"/${pkgname}-*/build/rhubarb/rhubarb "${pkgdir}"/usr/bin/
	chmod 755 "${pkgdir}"/usr/bin/rhubarb
}
