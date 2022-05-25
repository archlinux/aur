# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Moops
cpanauthor=TOBYINK
pkgname=perl-moops
pkgver=0.038
pkgrel=1
pkgdesc="Perl Moops CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
   'perl'
   'perl-class-tiny'
   'perl-exporter-tiny'
   'perl-import-into'
   'perl-kavorka'
   'perl-keyword-simple'
   'perl-lexical-accessor'
   'perl-module-runtime'
   'perl-moo'
   'perl-moose'
   'perl-moox-late'
   'perl-moosex-mungehas'
   'perl-moosex-types-common'
   'perl-namespace-autoclean'
   'perl-parse-keyword'
   'perl-perlx-assert'
   'perl-perlx-define'
   'perl-true'
   'perl-try-tiny'
   'perl-types-xsd'
   'perl-variable-magic'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('dab17605fe09956abe2f70c6c1ce614c989b4997ae7a7269f929cd3ad72d56a9')

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
