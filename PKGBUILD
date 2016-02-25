# Maintainer: Jack Frost <fbt@fleshless.org>
# % Trigger: 1434463564 %

pkgname='spark-rc'
pkgdesc='A simple rc script'
license=( 'BSD' )
pkgver=1.9.1
_commit='0afbcc55f24e4d3b5028afbe03b9a4ce7d6aaede'
pkgrel=1
arch=( 'any' )
url='https://gitlab.com/fbt/spark-rc'

conflicts=( sysvinit-tools-adds )

backup=( 'etc/rc.conf' )

source=( "https://gitlab.com/fbt/spark-rc/repository/archive.tar.gz?ref=1.9.1" )

build() {
	cd "${srcdir}/${pkgname}-${pkgver}-${_commit}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}-${_commit}"

	make USR=/usr DESTDIR="$pkgdir" install
}

sha1sums=('1014adef3b8cbf6e0830d4bc167aad41d8117eb4')
