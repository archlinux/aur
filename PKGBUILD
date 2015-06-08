# Maintainer: Jack Frost <fbt@fleshless.org>

pkgname='spark-rc'
pkgdesc='A simple rc script'
license=( 'BSD' )
pkgver=1.7.2
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

sha1sums=('0f4443fa254ff9a81cfff755c49b98976853d600')
