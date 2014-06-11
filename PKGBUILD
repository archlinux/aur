# CPAN Name  : Object::Declare
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-object-declare
pkgver=0.22
pkgrel=2
pkgdesc='Perl package providing a declarative object constructor'
arch=('any')
url='http://search.cpan.org/dist/Object-Declare'
license=('MIT')
depends=('perl' 'perl-sub-override')
source=(http://search.cpan.org/CPAN/authors/id/A/AU/AUDREYT/Object-Declare-0.22.tar.gz)
options=(!emptydirs)
md5sums=('9607cd7b485bd7e01c3286f1dd8df187')

build() {
	cd Object-Declare-0.22
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Object-Declare-0.22
	make test
}

package() {
	cd Object-Declare-0.22
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
