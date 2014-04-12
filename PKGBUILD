# CPAN Name  : Path::Tiny
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-path-tiny
pkgver=0.052
pkgrel=1
pkgdesc='A small and fast Perl module for working with file paths'
arch=('any')
url='http://search.cpan.org/dist/Path-Tiny'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.17.8')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Path-Tiny-0.052.tar.gz)
options=(!emptydirs)
md5sums=('348e1ba505b26a5037f05e1b5059f21d')

build() {
	cd Path-Tiny-0.052
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Path-Tiny-0.052
	make test
}

package() {
	cd Path-Tiny-0.052
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
