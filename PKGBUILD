# CPAN Name  : WWW::Expand
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-www-expand
pkgver=0.1.4
pkgrel=1
pkgdesc='Perl module to expand any shortened URL'
arch=('any')
url='http://search.cpan.org/dist/WWW-Expand'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.8'
	'perl-http-message'
	'perl-libwww'
	'perl-strictures')
source=(http://search.cpan.org/CPAN/authors/id/G/GL/GLITCHMR/WWW-Expand-0.1.4.tar.gz)
options=(!emptydirs)
md5sums=('9bbd23792c04aa655b90309fb819f508')

build() {
	cd WWW-Expand-0.1.4
	PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd WWW-Expand-0.1.4
	make test
}

package() {
	cd WWW-Expand-0.1.4
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
