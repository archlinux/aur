# Maintainer: Marco A Rojas <marquicus@gmail.com>

pkgname=pgsi
pkgver=1.7.1
pkgrel=1
pkgdesc="Postgres System Impact report, a script that analyzes Postgres log files and reports on which queries have the highest overall impact on the server"
arch=('any')
url="https://bucardo.org/Pgsi/"
license=('custom')
depends=('perl' 'perl-dbd-pg')
optdepends=('postgresql')
source=(https://github.com/bucardo/pgsi/archive/${pkgver}.tar.gz)
sha512sums=('0046d2f254c9bab0b96da2ab55f209966f5f40870a45c53b6b4924effc03a1bddf06ce4779a274f955919907d6198055e8a43d4bceb7413ffdd2b9e8b35a4196')


build() {
	cd ${pkgname}-${pkgver}
	perl Makefile.PL
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make install DESTDIR=${pkgdir}
}

