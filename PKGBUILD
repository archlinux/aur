# Maintainer: JSkier, jskier.com
# Created by Gillen Dan

pkgname=fred
pkgver=0.1.0beta4
pkgrel=2
pkgdesc="Digital forensics tool for viewing and reporting on Windows registry files"
arch=("i686" "x86_64")
url="https://www.pinguin.lu/index.php"
license=("LGPL3")
depends=("qt" "hivex")
makedepends=("qt" "hivex")
options=(!emptydirs)
source=("http://files.pinguin.lu/projects/fred-0.1.0beta4.tar.gz")
md5sums=('47a86274228d83b2e4544c4caf1a8f98')

build() {
	cd "${srcdir}"/${pkgname}-${pkgver}
	qmake fred.pro
	make
        }

package() {
# Binary
	install -D ${srcdir}/${pkgname}-${pkgver}/${pkgname}  ${pkgdir}/usr/bin/${pkgname} || return 1

# .desktop file and icon
	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/resources/${pkgname}.desktop \
	    ${pkgdir}/usr/share/applications/${pkgname}.desktop || return 1
	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/resources/${pkgname}.png \
	    ${pkgdir}/usr/share/pixmaps/${pkgname}.png || return 1
}
