# CPAN Name  : HTTP::MultiPartParser
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-http-multipartparser
pkgver=0.02
pkgrel=1
pkgdesc='Perl package to parse MultiPart MIME data streams'
arch=('any')
url='https://metacpan.org/release/HTTP-MultiPartParser'
license=('PerlArtistic' 'GPL')

depends=('perl')
checkdepends=('perl-test-deep')
source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHANSEN/HTTP-MultiPartParser-0.02.tar.gz)
options=(!emptydirs)
md5sums=('1b07ebac54ce3288c044a23ba60196d2')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps"
}

build() {
	cd HTTP-MultiPartParser-0.02
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd HTTP-MultiPartParser-0.02
	sanitize
	make test
}

package() {
	cd HTTP-MultiPartParser-0.02
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
