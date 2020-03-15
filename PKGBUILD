# CPAN Name  : WWW::Expand
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-www-expand
pkgver=0.1.5
pkgrel=2
pkgdesc='Perl module to expand any shortened URL'
arch=('any')
url='https://metacpan.org/release/WWW-Expand'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.8'
	'perl-http-message'
	'perl-libwww'
	'perl-strictures')
source=(http://search.cpan.org/CPAN/authors/id/G/GL/GLITCHMR/WWW-Expand-0.1.5.tar.gz)
options=(!emptydirs)
md5sums=('a3544dd7ac8aa6406864492c431d3046')

build() {
	cd WWW-Expand-0.1.5
	PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd WWW-Expand-0.1.5
	make test
}

package() {
	cd WWW-Expand-0.1.5
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
