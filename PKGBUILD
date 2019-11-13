# Maintainer: Hinerk <hinerk.stender@mail.de>

pkgname=newtonwars
arch=('any')
pkgdesc='turn-based strategic shooter with lots of gravity'
pkgver=1
pkgrel=3
url='https://github.com/Draradech/NewtonWars'
depends=('freeglut')

source=(
	'https://github.com/Draradech/NewtonWars/archive/master.zip'
	'nw'
)
sha256sums=(
	'8fa0e5f53fce3eb862dd95aa6c8d8debc4dddf327e15733d9652d92403b388b2'
	'cca47c62bc0320204cd8f5eaa7c23b2d844a92085b284c62cd38a34a481344c3'
)

build() {
	cd ${srcdir}/NewtonWars-master
	./build-linux.sh
}

package() {
	install -D ${srcdir}/NewtonWars-master/nw ${pkgdir}/usr/share/newtonwars/nw
	install -D ${srcdir}/NewtonWars-master/font24.raw ${pkgdir}/usr/share/newtonwars/font24.raw
	install -D ${srcdir}/nw ${pkgdir}/usr/bin/nw

}
