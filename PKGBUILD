# CPAN Name  : Object::Declare
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-object-declare
pkgver=0.24
pkgrel=2
pkgdesc='Perl package providing a declarative object constructor'
arch=('any')
url='https://metacpan.org/release/Object-Declare'
license=('MIT')
depends=('perl-sub-override')
makedepends=('perl-module-build>=0.28')
source=(http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Object-Declare-0.24.tar.gz)
options=(!emptydirs)
md5sums=('cc25b758ff287b33b6d6db21e4ce976f')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Object-Declare-0.24
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Object-Declare-0.24
	sanitize
	make test
}

package() {
	cd Object-Declare-0.24
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
