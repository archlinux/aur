# CPAN Name  : MooseX::Getopt
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-moosex-getopt
pkgver=0.56
pkgrel=2
pkgdesc='A Moose role for processing command line options'
arch=('any')
url='http://search.cpan.org/dist/MooseX-Getopt'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-getopt-long-descriptive>=0.081' 'perl-moose>=0.56' 'perl-moosex-role-parameterized')
checkdepends=('perl-test-fatal>=0.003' 'perl-test-requires>=0.05' 
	'perl-test-warn>=0.21' 'perl-test-trap' 'perl-test-checkdeps'
	'perl-config-any' 'perl-path-tiny')
source=(http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Getopt-0.56.tar.gz)
options=(!emptydirs)
md5sums=('ce40f6ff4c13d122d252b8e22ffbcf1a')

build() {
  cd "$srcdir/MooseX-Getopt-0.56"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
	cd "$srcdir/MooseX-Getopt-0.56"
	make test
}

package() {
  cd "$srcdir/MooseX-Getopt-0.56"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
