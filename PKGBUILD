# Maintainer: Wu Junyu (aka Tenshi65535) <wu.junyu.aur@outlook.com>
# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
pkgname=qsoas
pkgver=3.1
pkgrel=1
pkgdesc="Open-source software developed to analyze electrochemical data and other one-dimensional signals."
arch=('x86_64')
url="https://bip.cnrs.fr/groups/bip06/software/"
license=('GPL2')
depends=('ruby' 'mruby' 'gsl' 'qt5-base')
provides=('qsoas')
conflicts=('qsoas')
install=
source=("https://bip.cnrs.fr/wp-content/uploads/qsoas/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.desktop")
md5sums=('661ef55a4de1e4bddaeaaa3f0256ee25'
         '05857d790bc8bb91efcaf95f72ec2d7a')

build() {
	cd "$pkgname-$pkgver"
	qmake-qt5
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 ../${pkgname}.desktop \
		${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm644 ./QSoas-logo.png \
		${pkgdir}/usr/share/pixmaps/${pkgname}.png
	install -Dm755 ./QSoas ${pkgdir}/usr/bin/${pkgname}
}
