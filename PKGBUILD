# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=DynaLoader-Functions
cpanauthor=ZEFRAM
pkgname=perl-dynaloader-functions
pkgver=0.002
pkgrel=1
pkgdesc="Perl DynaLoader::Functions CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-module-build')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('c7335cda1a10eb0249171a6c1f282b0a0ae5366a656292f236a52a309c83b1aa')

build() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 perl Makefile.PL
	 make
}

check() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 make test
}

package () {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
