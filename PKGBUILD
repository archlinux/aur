# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Parse-Keyword
cpanauthor=DOY
pkgname=perl-parse-keyword
pkgver=0.08
pkgrel=1
pkgdesc="Perl Parse::Keyword CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-devel-callparser')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('84906fc0b7321e4247baa969fbd07894782e75c7847f563cfe3ad31b0b8bda32')

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
