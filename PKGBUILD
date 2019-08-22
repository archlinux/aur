# CPAN Name  : Class::InsideOut
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-class-insideout
pkgver=1.14
pkgrel=2
pkgdesc='Perl module for safe and simple inside-out objects construction'
arch=('any')
url='https://metacpan.org/release/Class-InsideOut'
license=('Apache')
depends=('perl-class-isa')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Class-InsideOut-1.14.tar.gz)
md5sums=('cf9fe58eec6f61c6e483c75479e4a367')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps"
}

build() {
	cd Class-InsideOut-1.14
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Class-InsideOut-1.14
	sanitize
	make test
}

package() {
	cd Class-InsideOut-1.14
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
