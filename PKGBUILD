# Maintainer: Jack Frost <fbt@fleshless.org>
# % Trigger: 1434463564 %

pkgname='spark-rc'
pkgdesc='A simple rc script'
license=( 'BSD' )
pkgver=1.11.1
pkgrel=1
arch=( 'any' )
url='https://gitlab.com/fbt/spark-rc'

depends=( halt-ubase-git )
conflicts=( sysvinit-tools-adds )

backup=( 'etc/rc.conf' )

source=( "https://git.fleshless.org/spark-rc/snapshot/spark-rc-${pkgver}.tar.gz" )

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make USR=/usr DESTDIR="$pkgdir" install
}

sha1sums=('338fbd912b1893f6543f4c83d18cb1f594d05a0d')
