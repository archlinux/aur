# Find this package on https://github.com/pietmacom/kopano-pkgbuilds.git
# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

pkgname='kopano-webapp-nginx'
pkgver=1
pkgrel=1
pkgdesc='NGINX-, PHP-FPM-Settings'
groups=(
    'kopano'
	)
arch=(
    'any'
     )
source=(
    'nginx-location.conf'
    'nginx-ssl.example.conf'
    'php-fpm.example.conf'
    'kopano-webapp.conf'
    )
md5sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)
depends=(
    'kopano-webapp'
    'nginx'
    'php-fpm'
    'php'
	)
backup=(
    "etc/php/fpm.d/${pkgname}.conf"
)

package() {
    cd ${srcdir}

    # NGINX
    mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
    cp nginx-location.conf nginx-ssl.example.conf php-fpm.example.conf \
	${pkgdir}/usr/share/doc/${pkgname}

    # PHP-FPM
    mkdir -p ${pkgdir}/etc/php/fpm.d
    cp kopano-webapp.conf ${pkgdir}/etc/php/fpm.d
}