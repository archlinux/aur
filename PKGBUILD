# CPAN Name  : Unicode::LineBreak
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-unicode-linebreak
pkgver=2015.07.16
pkgrel=1
pkgdesc='Perl package implementing UAX #14 Unicode line breaking algorithm'
arch=('any')
url='https://metacpan.org/release/Unicode-LineBreak'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.8' 'perl-mime-charset>=1.006.2' 'sombok')
source=(http://search.cpan.org/CPAN/authors/id/N/NE/NEZUMI/Unicode-LineBreak-2015.07.16.tar.gz)
options=(!emptydirs)
md5sums=('8e811b9b9c47fdc7fa3a5c55e1a9c0ea')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Unicode-LineBreak-2015.07.16
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Unicode-LineBreak-2015.07.16
	sanitize
	make test
}

package() {
	cd Unicode-LineBreak-2015.07.16
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
