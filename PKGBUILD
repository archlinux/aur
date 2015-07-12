# CPAN Name  : Unicode::LineBreak
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-unicode-linebreak
pkgver=2015.06
pkgrel=1
pkgdesc='Perl package implementing UAX #14 Unicode line breaking algorithm'
arch=('any')
url='https://metacpan.org/release/Unicode-LineBreak'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.8' 'perl-mime-charset>=1.006.2' 'sombok')
source=(http://search.cpan.org/CPAN/authors/id/N/NE/NEZUMI/Unicode-LineBreak-2015.06.tar.gz)
options=(!emptydirs)
md5sums=('a4088bdf6be0b5eed24a0860aaf69467')

build() {
	cd Unicode-LineBreak-2015.06
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Unicode-LineBreak-2015.06
	make test
}

package() {
	cd Unicode-LineBreak-2015.06
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
