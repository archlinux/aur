# Maintainer: Peter Lamby <peterlamby at web dot de>
pkgname=perl-test-tabs
pkgver=0.005
pkgrel=1
pkgdesc='checks the presence of tabs in your project'
_dist=Test-Tabs
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl)
options=('!emptydirs' purge)
source=("http://www.cpan.org/modules/by-module/Test/Test-Tabs-$pkgver.tar.gz")
sha265sums=('716d514e606d81f76f595ce61738f1eb20085429be21eb8af8fba61374a12d2b')
md5sums=('5a484f3f8175614faf8d7f19d202a100')

build() (
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	/usr/bin/perl Makefile.PL
	 make
)

check() (
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	make test
)

package() (
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
