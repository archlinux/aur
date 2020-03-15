# CPAN Name  : Scalar::Defer
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-scalar-defer
pkgver=0.23
pkgrel=3
pkgdesc='Perl package that provides lazy evaluation of scalars'
arch=('any')
url='https://metacpan.org/release/Scalar-Defer'
license=('MIT')
depends=('perl' 'perl-class-insideout' 'perl-exporter-lite')
source=(http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/Scalar-Defer-0.23.tar.gz)
options=(!emptydirs)
md5sums=('df4e9d0b8ca20274376a032d40703c57')

build() {
	cd Scalar-Defer-0.23
	PERL_AUTOINSTALL='--skipdeps' PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Scalar-Defer-0.23
	make test
}

package() {
	cd Scalar-Defer-0.23
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
