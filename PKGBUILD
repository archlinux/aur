# CPAN Name  : Inline::C
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-inline-c
pkgver=0.76
pkgrel=1
pkgdesc='Perl module providing a way to write Perl subroutines in C'
arch=('any')
url='https://metacpan.org/release/Inline-C'
license=('PerlArtistic' 'GPL')
options=(!emptydirs)
depends=(
	'perl>=5.21.6'
	'perl-inline>=0.79'
	'perl-parse-recdescent>=1.967009'
	'perl-pegex>=0.58')
checkdepends=(
	'perl-file-copy-recursive'
	'perl-io-all'
	'perl-test-warn>=0.23'
	'perl-yaml-libyaml')
source=(http://search.cpan.org/CPAN/authors/id/I/IN/INGY/Inline-C-0.76.tar.gz)
md5sums=('c0fbfdd058075c9271a1384c822c9a87')

build() {
	cd Inline-C-0.76
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Inline-C-0.76
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	make test
}

package() {
	cd Inline-C-0.76
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
