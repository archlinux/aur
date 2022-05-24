# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=MooseX-MungeHas
cpanauthor=TOBYINK
pkgname=perl-moosex-mungehas
pkgver=0.011
pkgrel=1
pkgdesc="Perl MooseX::MungeHas CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
checkdepends=(
    'perl-moo'
    'perl-moose'
    'perl-mouse'
)
depends=(
    'perl'
    'perl-test-fatal'
    'perl-test-requires'
    'perl-type-tiny'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('863bc8e9049f2c06f0af15fa4b413f287be2c0821d1981661803ceae36d06495')

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
