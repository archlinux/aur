# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=sais
pkgver=1.6.2
pkgrel=1
pkgdesc='Strange Adventures In Infinite Space is a roguelike video game created by the indie developer Digital Eel'
url='http://digital-eel.com/sais/'
license=('GPL3')
arch=('x86_64' 'aarch64')
depends=()
makedepends=('tar' 'cmake' 'git' 'wget' 'make' 'sdl2' 'sdl2_mixer')
source=("https://github.com/kuroneko/sais/archive/v${pkgver}.tar.gz")
sha512sums=('4f44eb367a0feecfdf2f25dae81f8335d0ea0db99fd3ae89f298bd9dae373d51db7f14c67b1ea0552ca2f72ce64db1372daa8b14876d6e0c04ad28a6bc0e7bb7')

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
