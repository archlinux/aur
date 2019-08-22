# CPAN Name  : CGI::Cookie::Splitter
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-cgi-cookie-splitter
pkgver=0.05
pkgrel=1
pkgdesc='Perl package to split big cookies into smaller ones'
arch=('any')
url='https://metacpan.org/release/CGI-Cookie-Splitter'
license=('PerlArtistic' 'GPL')
depends=('perl-cgi-simple' 'perl-namespace-clean')
makedepends=('perl-module-build-tiny>=0.034')
source=(http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/CGI-Cookie-Splitter-0.05.tar.gz)
options=(!emptydirs)
md5sums=('babec7ae6c13e22d80140671b41fd349')

build() {
	cd CGI-Cookie-Splitter-0.05
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd CGI-Cookie-Splitter-0.05
	make test
}

package() {
	cd CGI-Cookie-Splitter-0.05
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
