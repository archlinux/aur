# CPAN Name  : Algorithm::Combinatorics
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-algorithm-combinatorics
pkgver=0.27
pkgrel=1
pkgdesc='Perl module for efficient generation of combinatorial sequences'
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/Algorithm-Combinatorics'
license=('GPL' 'PerlArtistic')
source=(http://search.cpan.org/CPAN/authors/id/F/FX/FXN/Algorithm-Combinatorics-0.27.tar.gz)
depends=('perl')   # provides 'perl-scalar-list-utils', 'perl-xsloader'
makedepends=()     # provides 'perl-extutils-makemaker'
checkdepends=()    # provides 'perl-test-simple'
options=(!emptydirs)
md5sums=('bada976399f9edfe364d6fcf9e0bcde2')

build() {
	cd Algorithm-Combinatorics-0.27
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Algorithm-Combinatorics-0.27
	make test
}

package() {
	cd Algorithm-Combinatorics-0.27
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
