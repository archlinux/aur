# CPAN Name  : Algorithm::Permute
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-algorithm-permute
pkgver=0.16
pkgrel=2
pkgdesc='Perl package for handy and fast permutations with object oriented interface'
arch=('i686' 'x86_64')
url='https://metacpan.org/release/Algorithm-Permute'
license=('GPL')
depends=('perl')
checkdepends=('perl-test-leaktrace')
source=(http://search.cpan.org/CPAN/authors/id/S/SL/SLOYD/Algorithm-Permute-0.16.tar.gz)
options=(!emptydirs)
md5sums=('baa3ca012c8f7e37b5c479a7c1439cb4')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Algorithm-Permute-0.16
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Algorithm-Permute-0.16
	sanitize
	make test
}

package() {
	cd Algorithm-Permute-0.16
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
