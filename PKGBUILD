# CPAN Name  : CGI::Application::Plugin::DBH
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-cgi-application-plugin-dbh
pkgver=4.04
pkgrel=1
pkgdesc='Perl package for easy DBI access from CGI::Application'
arch=('any')
url='http://search.cpan.org/dist/CGI-Application-Plugin-DBH'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.1' 'perl-cgi-application' 'perl-dbi')
checkdepends=('perl-test-mockobject>=1.20120301' 'perl-dbd-mock>=0.11')
source=(http://search.cpan.org/CPAN/authors/id/F/FR/FREW/CGI-Application-Plugin-DBH-4.04.tar.gz)
options=(!emptydirs)
md5sums=('da6d7bc3b084624fffadd34834f71f77')

build() {
	cd CGI-Application-Plugin-DBH-4.04
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd CGI-Application-Plugin-DBH-4.04
	make test
}

package() {
	cd CGI-Application-Plugin-DBH-4.04
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
