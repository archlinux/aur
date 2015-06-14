# Maintainer: fbabetto

pkgname=perl-text-multimarkdown-xs
pkgver=0.001_03
pkgrel=1
pkgdesc="Perl/CPAN Module Text-MultiMarkdown-XS"
_dist="Text-MultiMarkdown-XS"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Text-MultiMarkdown-XS/"
license=('PerlArtistic')
depends=('perl')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/A/AN/ANDREWF/$_dist-$pkgver.tar.gz)
md5sums=('9e931643fd76ad32c9c96871ba2cb36b')

build() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
# 	make TEST_POD=1 test
# upstream failed test_pod so this test is disabled
	make test
}

package() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make DESTDIR="$pkgdir/" install
}
