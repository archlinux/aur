# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Parse-Keyword
cpanauthor=HAARG
pkgname=perl-parse-keyword
pkgver=0.09
pkgrel=1
pkgdesc="Perl Parse::Keyword CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-devel-callparser')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('6735a7e48fcebc28d188a0403df6a5a19e4cbeb84b3f2c7fbb816aef6de369ca')

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
