# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Moops
cpanauthor=TOBYINK
pkgname=perl-moops
pkgver=0.034
pkgrel=1
pkgdesc="Perl Moops CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
   'perl'
   'perl-exporter-tiny'
   'perl-import-into'
   'perl-kavorka'
   'perl-keyword-simple'
   'perl-lexical-accessor'
   'perl-module-runtime'
   'perl-moo'
   'perl-moox-late'
   'perl-moosex-mungehas'
   'perl-namespace-autoclean'
   'perl-parse-keyword'
   'perl-perlx-assert'
   'perl-true'
   'perl-try-tiny'
   'perl-variable-magic'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('f1de78dd3bb4d7f284b248dc4abbcb81014de3992cad0ab84ff268894f6ae854')

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
