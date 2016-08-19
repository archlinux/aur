# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

pkgname=('zarafa-service-overview')
groups=('zarafa'
	'kopano')
pkgver=1.0.1
pkgrel=1
pkgdesc='Zarafa service overview'
arch=('any')
url='http://www.pietma.com/'
license=('AGPL3')
depends=('php<7'
	 'php-fpm<7')
source=('quicksand.ttf'
	'index.php'
	'zarafa-service-overview.conf'
	'nginx-location.conf'
	'nginx-ssl.example.conf')
md5sums=('3c7073a635ae457478a9b3b2d50e49bc'
         'ca01d86c31225de62994aa13466bde81'
         'e839fb93c54759eb809a40957ae6b9c9'
         '066aed78b8cba492321defca1df78b55'
         '1bdab5b1e4473c1b0f6ce2e5c8f1da61')

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
}

