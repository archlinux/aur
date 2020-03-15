# CPAN Name  : Math::Interpolate
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-math-interpolate
pkgver=1.06
pkgrel=2
pkgdesc='Perl module providing routines for interpolating data sets'
arch=('any')
url='https://metacpan.org/release/Math-Interpolate'
license=('PerlArtistic' 'GPL')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/B/BZ/BZAJAC/Math-Interpolate-1.06.tar.gz)
options=(!emptydirs)
md5sums=('06529ef3b1c94f32a0da5dbe0ebdef5e')

build() {
	cd Math-Interpolate-1.06
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Math-Interpolate-1.06
	make test
}

package() {
	cd Math-Interpolate-1.06
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
