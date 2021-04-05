# Maintainer: Mark Collins < tera_1225 hat hotmail dote com>
# Contributor: gls < ghostlovescorebg at gmail dot com >

pkgname=rompr
pkgver=1.55
pkgrel=1
pkgdesc="Web frontend to MPD"
arch=('any')
url="https://github.com/fatg3erman/RompR/releases"
license=('custom')
depends=('imagemagick'
         'php'
         'php-sqlite'
         'php-gd'
         # 'php-json' included in php
         # 'php-curl' included in php
         # 'php-xml' included in php
         # 'php-mbstring' included in php
         'php-intl')
optdepends=('apache'
            'lighttpd'
            'nginx'
            'php-jsonreader-git: Low Memory Mode')
source=("${url}/download/${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('23745cd02dc6e4264fe35220eec64754')

build () {
	cd "${srcdir}/${pkgname}"
}

package() {
	cd "${srcdir}"
	find -name '.svn' -delete
	install -d "${pkgdir}/usr/share/webapps"
	cp -ra rompr "${pkgdir}/usr/share/webapps/"
}
