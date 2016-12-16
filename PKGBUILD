# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Devel-CallParser
cpanauthor=ZEFRAM
pkgname=perl-devel-callparser
pkgver=0.002
pkgrel=1
pkgdesc="Perl Devel::CallParser CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
   'perl'
   'perl-data-alias'
   'perl-devel-callchecker'
   'perl-devel-declare'
   'perl-dynaloader-functions'
   'perl-test-pod'
   'perl-test-pod-coverage'
)
makedepends=(
   'perl-module-build'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('24b198c0fdde08a526559759dc49238f5acf1a960580880d5e6a864b5d7b3167')

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
