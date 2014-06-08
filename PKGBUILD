# CPAN Name  : Unicode::LineBreak
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-unicode-linebreak
pkgver=2013.11
pkgrel=1
pkgdesc='Perl package implementing UAX #14 Unicode line breaking algorithm'
arch=('any')
url='http://search.cpan.org/dist/Unicode-LineBreak'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.8' 'perl-mime-charset>=1.006.2' 'sombok')
source=(http://search.cpan.org/CPAN/authors/id/N/NE/NEZUMI/Unicode-LineBreak-2013.11.tar.gz)
options=(!emptydirs)
md5sums=('994da3b6dab60486249034d2502fba28')

build() {
	cd Unicode-LineBreak-2013.11
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Unicode-LineBreak-2013.11
	make test
}

package() {
	cd Unicode-LineBreak-2013.11
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
