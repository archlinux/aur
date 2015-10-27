# Maintainer: Jack Frost <fbt@fleshless.org>
# % Trigger: 1434463564 %

pkgname='spark-rc'
pkgdesc='A simple rc script'
license=( 'BSD' )
pkgver=1.9.1
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

sha1sums=('6624437cae78220205fbcac4d5330192235efb69')
