# CPAN Name  : Inline::C
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-inline-c
pkgver=0.73
pkgrel=1
pkgdesc='Perl module providing a way to write Perl subroutines in C'
arch=('any')
url='http://search.cpan.org/dist/Inline-C'
license=('PerlArtistic' 'GPL')
options=(!emptydirs)
depends=(
	'perl>=5.5.4'
	'perl-inline>=0.77'
	'perl-parse-recdescent>=1.80'
	'perl-extutils-makemaker-aur>=7.00'
	'perl-pegex>=0.55')
checkdepends=(
	'perl>=5.10.1'
	'perl-file-copy-recursive'
	'perl-io-all'
	'perl-test-warn>=0.23'
	'perl-yaml-libyaml')
source=(http://search.cpan.org/CPAN/authors/id/I/IN/INGY/Inline-C-0.73.tar.gz)
md5sums=('fb9a7dc92b959ab023838357767a5251')

build() {
	cd Inline-C-0.73
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Inline-C-0.73
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	make test
}

package() {
	cd Inline-C-0.73
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
