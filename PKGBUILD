# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

pkgname=('zarafa-service-overview')
groups=('zarafa')
pkgver=1.0.2
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
	'nginx-ssl.example.conf'
	'mozilla-account-configuration.php')
md5sums=('3c7073a635ae457478a9b3b2d50e49bc'
         '0f36005bfc9223a1d94b29d1c337b22d'
         'e839fb93c54759eb809a40957ae6b9c9'
         '5ea956725a183251c630cd294b43beba'
         '1bdab5b1e4473c1b0f6ce2e5c8f1da61'
         '7df71826f100a44d72c8a68e1c8ea063')

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

