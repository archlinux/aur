# CPAN Name  : Test::WWW::Mechanize::PSGI
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-test-www-mechanize-psgi
pkgver=0.38
pkgrel=1
pkgdesc='Perl module to test PSGI programs using WWW::Mechanize'
arch=('any')
url='https://metacpan.org/release/Test-WWW-Mechanize-PSGI'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-plack' 'perl-test-www-mechanize' 'perl-try-tiny')
checkdepends=('perl-cgi')
source=(http://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/Test-WWW-Mechanize-PSGI-0.38.tar.gz)
options=(!emptydirs)
md5sums=('f052623af9730764ad58c9ac0939edf5')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Test-WWW-Mechanize-PSGI-0.38
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Test-WWW-Mechanize-PSGI-0.38
	sanitize
	make test
}

package() {
	cd Test-WWW-Mechanize-PSGI-0.38
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
