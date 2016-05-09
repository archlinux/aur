# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=cqrlogo
pkgver=0.5.4
pkgrel=1
pkgdesc="CGI QR-Code logo for web services"
arch=('i686' 'x86_64')
url="https://github.com/eworm-de/cqrlogo"
depends=('iniparser' 'libpng' 'qrencode')
makedepends=('fcgi' 'markdown')
optdepends=('apache: for apache web server inclusion'
	'fcgi: for FastCGI version'
	'lighttpd: for lighttpd web server inclusion'
	'mod_fastcgi: for fastcgi in apache web server'
	'mod_fcgid: for fastcgi in apache web server')
conflicts=('cqrlogo-git')
checkdepends=('zbar' 'pngcheck')
license=('GPL')
install=cqrlogo.install
backup=('etc/cqrlogo.conf'
	'etc/httpd/conf/extra/cqrlogo.conf'
	'etc/lighttpd/conf.d/cqrlogo.conf')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('26bf9c8b8fdab7337a0115a641d63ca2e4ff91db73b43475cc751f5a878b1aa6'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

check() {
	cd ${pkgname}-${pkgver}/

	make check
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

