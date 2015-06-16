# Maintainer: Jack Frost <fbt@fleshless.org>

pkgname='spark-rc'
pkgdesc='A simple rc script'
license=( 'BSD' )
pkgver=1.7.3
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

sha1sums=('d5217f4eac98e5315844ea00225f6f76d270acf5')
