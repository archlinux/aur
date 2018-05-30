# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

pkgname=('kopano-service-overview')
replaces=("zarafa-service-overview")
groups=('kopano')
pkgver=1.0.2
pkgrel=1
pkgdesc='Kopano service overview'
arch=('any')
url='http://www.pietma.com/'
license=('AGPL3')
depends=('php'
	 'php-fpm')
source=('quicksand.ttf'
	'index.php'
	'kopano-service-overview.conf'
	'nginx-location.conf'
	'nginx-ssl.example.conf'
	'mozilla-account-configuration.php')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

package() {
    cd ${srcdir}

    mkdir -p ${pkgdir}/etc/php/fpm.d
    cp ${srcdir}/${pkgname}.conf ${pkgdir}/etc/php/fpm.d
    
    mkdir -p ${pkgdir}/etc/webapps/${pkgname}/
    cp ${srcdir}/nginx-ssl.example.conf ${pkgdir}/etc/webapps/${pkgname}/
    cp ${srcdir}/nginx-location.conf ${pkgdir}/etc/webapps/${pkgname}/
    
    mkdir -p ${pkgdir}/usr/share/webapps/${pkgname}/
    cp quicksand.ttf ${pkgdir}/usr/share/webapps/${pkgname}/
    cp index.php ${pkgdir}/usr/share/webapps/${pkgname}/
    cp mozilla-account-configuration.php ${pkgdir}/usr/share/webapps/${pkgname}/
}

