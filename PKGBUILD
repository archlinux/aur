# Maintainer: Jack Frost <fbt@fleshless.org>
# % Trigger: 1434463564 %

pkgname='spark-rc'
pkgdesc='A simple rc script'
license=( 'BSD' )
pkgver=1.8.5
pkgrel=1
arch=( 'any' )
url='https://github.com/fbt/spark-rc'

conflicts=( sysvinit-tools-adds )

backup=( 'etc/rc.conf' )

source=( "https://github.com/fbt/spark-rc/archive/${pkgver}.tar.gz" )

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make USR=/usr DESTDIR="$pkgdir" install
}

sha1sums=('4d1afbe7b272039309a0a6010540563aa534b5a3')
