# CPAN Name  : XML::Compile
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-xml-compile
pkgver=1.50
pkgrel=1
pkgdesc='Perl package providing compilation-based XML processing'
arch=('any')
url='https://metacpan.org/release/XML-Compile'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.13.7'
	'perl-xml-libxml>=2.01'
	'perl-xml-compile-tester>=0.90'
	'perl-log-report>=1.03')
checkdepends=('perl-test-deep>=0.095')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/XML-Compile-1.50.tar.gz)
options=(!emptydirs)
md5sums=('e8a7d600ce8c3d261628f2b6bc8c0b5d')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd XML-Compile-1.50
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd XML-Compile-1.50
	sanitize
	make test
}

package() {
	cd XML-Compile-1.50
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
