# Maintainer: Max Roder <maxroder@mailbox.org>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=cmsmadesimple
pkgver=1.12
pkgrel=1
pkgdesc="An easy to use content management system for simple stable content sites."
arch=('any')
url="http://www.cmsmadesimple.org"
license=('GPL')
depends=('php' 'mysql')
optdepends=('apache' 'lighttpd')
install="cmsmadesimple.install"
source=(http://s3.amazonaws.com/cmsms/downloads/12559/${pkgname}-${pkgver}-english.tar.gz)
sha256sums=('2e5f7a077bf8b14a77b32125828a48f07b8354830495f393d13c964ecd2f6b3c')

package() {
	mkdir -p ${pkgdir}/srv/http/${pkgname}
	mv ${srcdir}/* ${pkgdir}/srv/http/${pkgname}
	rm ${pkgdir}/srv/http/${pkgname}/${pkgname}-${pkgver}-english.tar.gz
	#mv ${pkgdir}/srv/http/${pkgname}/config.php ${pkgdir}/srv/http/${pkgname}/config.php.new
	#touch ${pkgdir}/srv/http/${pkgname}/config.php
	chmod 0755 ${pkgdir}/srv/http/${pkgname}
	chmod 0777 ${pkgdir}/srv/http/${pkgname}/tmp/templates_c \
		${pkgdir}/srv/http/${pkgname}/tmp/cache \
		${pkgdir}/srv/http/${pkgname}/uploads \
		${pkgdir}/srv/http/${pkgname}/uploads/images \
		${pkgdir}/srv/http/${pkgname}/modules #\
		#${pkgdir}/srv/http/${pkgname}/config.php
}
