# CPAN Name  : Text::Ngram
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-text-ngram
pkgver=0.15
pkgrel=2
pkgdesc='Perl package for Ngram analysis of text'
arch=('i686' 'x86_64')
url='https://metacpan.org/release/Text-Ngram'
license=('PerlArtistic' 'GPL')
depends=('perl-unicode-casefold')
source=(http://search.cpan.org/CPAN/authors/id/A/AM/AMBS/Text/Text-Ngram-0.15.tar.gz)
options=(!emptydirs)
md5sums=('801395217f3986af9d8f07ce5a7be41a')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Text-Ngram-0.15
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Text-Ngram-0.15
	sanitize
	make test
}

package() {
	cd Text-Ngram-0.15
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
