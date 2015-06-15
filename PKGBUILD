# Maintainer: Aleksandr Boiko <brdcom@ya.ru>
pkgname=kalkun
pkgver=0.7.1
pkgrel=1
pkgdesc="Open source web based SMS management"
arch=('any')
url="http://kalkun.sourceforge.net/"
license=('GPL')
depends=('apache>=2.x' 'php-apache' 'php>=5.x' 'gammu' 'mariadb')
optdepends=('curl')
source=("http://sourceforge.net/projects/kalkun/files/kalkun/0.7.1/${pkgname}_${pkgver}.tar.bz2")
md5sums=('8d428f96f9339e9027f5c8138294e698')

package() {
	cd "$srcdir"
	install -d -m0755 "${pkgdir}/var/www/${pkgname}"
	mv application "${pkgdir}/var/www/${pkgname}/"
	mv install "${pkgdir}/var/www/${pkgname}/"
	mv media "${pkgdir}/var/www/${pkgname}/"
	mv scripts "${pkgdir}/var/www/${pkgname}/"
	mv system "${pkgdir}/var/www/${pkgname}/"
	mv index.php "${pkgdir}/var/www/${pkgname}/"

	install -D -m0644 CHANGELOG "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
	install -D -m0644 CREDITS "${pkgdir}/usr/share/doc/${pkgname}/CREDITS"
	install -D -m0644 FAQ "${pkgdir}/usr/share/doc/${pkgname}/FAQ"
	install -D -m0644 PLUGIN "${pkgdir}/usr/share/doc/${pkgname}/PLUGIN"
	install -D -m0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -D -m0644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

	rm "${pkgdir}/var/www/${pkgname}/scripts/daemon.bat"
}
