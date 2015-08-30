# Maintainer: Jack Frost <fbt@fleshless.org>
# % Trigger: 1434463564 %

pkgname='spark-rc'
pkgdesc='A simple rc script'
license=( 'BSD' )
pkgver=1.8.3
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

sha1sums=('7e43506d4e94cc4664d1ff22f7f37614fa8949c3')
