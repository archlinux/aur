# CPAN Name  : Template::Declare
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-template-declare
pkgver=0.47
pkgrel=2
pkgdesc='Pure-Perl declarative HTML/XUL/RDF/XML templating system'
arch=('any')
url='https://metacpan.org/release/Template-Declare'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.2'
	'perl-class-accessor'
	'perl-class-data-inheritable'
	'perl-class-isa'
	'perl-html-lint'
	'perl-string-bufferstack>=1.1')
checkdepends=('perl-test-warn>=0.11')
source=(http://search.cpan.org/CPAN/authors/id/A/AL/ALEXMV/Template-Declare-0.47.tar.gz)
options=(!emptydirs)
md5sums=('aba8a1dac80cebe15ac7b1b7c5ac5948')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps"
}

build() {
	cd Template-Declare-0.47
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Template-Declare-0.47
	sanitize
	make test
}

package() {
	cd Template-Declare-0.47
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
