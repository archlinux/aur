# CPAN Name  : CGI::Application::Plugin::DBH
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-cgi-application-plugin-dbh
pkgver=4.04
pkgrel=2
pkgdesc='Perl package for easy DBI access from CGI::Application'
arch=('any')
url='https://metacpan.org/release/CGI-Application-Plugin-DBH'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.1' 'perl-cgi-application' 'perl-dbi')
checkdepends=('perl-test-mockobject>=1.20120301' 'perl-dbd-mock>=0.11')
source=(http://search.cpan.org/CPAN/authors/id/F/FR/FREW/CGI-Application-Plugin-DBH-4.04.tar.gz)
options=(!emptydirs)
md5sums=('da6d7bc3b084624fffadd34834f71f77')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps"
}

build() {
	cd CGI-Application-Plugin-DBH-4.04
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd CGI-Application-Plugin-DBH-4.04
	sanitize
	make test
}

package() {
	cd CGI-Application-Plugin-DBH-4.04
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
