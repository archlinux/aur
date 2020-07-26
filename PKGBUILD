# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=sais
pkgver=1.6.1
pkgrel=1
pkgdesc='Strange Adventures In Infinite Space is a roguelike video game created by the indie developer Digital Eel'
url='http://digital-eel.com/sais/'
license=('GPL3')
arch=('x86_64' 'aarch64')
depends=()
makedepends=('tar' 'cmake' 'git' 'wget' 'make' 'sdl2' 'sdl2_mixer')
source=("https://github.com/kuroneko/sais/archive/v${pkgver}.tar.gz")
sha512sums=('3d64552553f6c0b4ed356e1dc50f33dfeaa741ecaa6ec0b43c0186eb5986bf9145d604f05898648eda0b173e64522c361d8c788886d05ba71b616f2227ec6000')

build() {
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/opt/${pkgname}/" .
	make all
}

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/opt/${pkgname}/"
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	make install
	ln -s "/opt/sais/strange" "${pkgdir}/usr/bin/strange"
	ln -s "/opt/sais/strange" "${pkgdir}/usr/bin/sais"
}
