# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

pkgname='kopano-webapp-nginx-git'
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
md5sums=('acb8acb6cef3b129d16c689fd87d488f'
         'bf914a706e3926b617a95cbe99e18a10'
         'cacf375cabab0eaf7792d2d3a1a6b11a'
         'c86f282632dd24812d1d639246f79889')
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
