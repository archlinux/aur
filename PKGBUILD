# CPAN Name  : CSS::Squish
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-css-squish
pkgver=0.10
pkgrel=2
pkgdesc='Perl package to compact many CSS files into one big file'
arch=('any')
url='https://metacpan.org/release/CSS-Squish'
license=('PerlArtistic' 'GPL')
depends=("perl" "perl-uri")
checkdepends=("perl-test-longstring")
	# 'perl' provides 'perl-test-simple'
	# optionally 'perl-test-pod', 'perl-test-pod-coverage'
source=(http://search.cpan.org/CPAN/authors/id/T/TS/TSIBLEY/CSS-Squish-0.10.tar.gz)
options=(!emptydirs)
md5sums=('59f8e2c26a2a89418d2274e8ca44ae97')

build() {
	cd CSS-Squish-0.10
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd CSS-Squish-0.10
	make test
}

package() {
	cd CSS-Squish-0.10
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
