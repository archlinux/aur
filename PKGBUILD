# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git

pkgname=betcon
pkgver=1.7.5
pkgrel=1
pkgdesc="Sports betting management"
url="http://betcon.eduardoparra.es"
arch=('any')
license=('GPLv3')
depends=('python' 'python-pyqt5' 'sqlite' 'python-pyexcel-ods' 'python-yaml' 'python-pillow')
source=("https://github.com/soker90/betcon/archive/$pkgver.tar.gz")
md5sums=('b3006f38d6ae487511b40e60965cdb36')

package() {
	mkdir -p ${pkgdir}/usr/share/betcon/default/
	mkdir -p ${pkgdir}/usr/share/betcon/resources/
	mkdir -p ${pkgdir}/usr/share/applications/
	mkdir -p ${pkgdir}/usr/share/pixmaps/
	mkdir -p ${pkgdir}/usr/bin/
	mkdir -p ${pkgdir}/usr/share/locale/
	cp -r ${srcdir}/${pkgname}-${pkgver}/src ${pkgdir}/usr/share/betcon/
	cp -r ${srcdir}/${pkgname}-${pkgver}/ui ${pkgdir}/usr/share/betcon/
	cp -r ${srcdir}/${pkgname}-${pkgver}/resources/bookies/ ${pkgdir}/usr/share/betcon/resources/
	cp -r ${srcdir}/${pkgname}-${pkgver}/resources/sports/ ${pkgdir}/usr/share/betcon/resources/
	cp ${srcdir}/${pkgname}-${pkgver}/default/database.sql ${pkgdir}/usr/share/betcon/default/
	cp ${srcdir}/${pkgname}-${pkgver}/resources/betcon.desktop ${pkgdir}/usr/share/applications/
	cp ${srcdir}/${pkgname}-${pkgver}/resources/icon.png ${pkgdir}/usr/share/pixmaps/betcon.png
	cp ${srcdir}/${pkgname}-${pkgver}/resources/betcon ${pkgdir}/usr/bin/
	chmod +x ${pkgdir}/usr/bin/betcon
	cp -r ${srcdir}/${pkgname}-${pkgver}/lang/mo/* ${pkgdir}/usr/share/locale/

}


