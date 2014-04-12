# CPAN Name  : DBM::Deep
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-dbm-deep
pkgver=2.0011
pkgrel=1
pkgdesc='A pure Perl multi-level hash/array DBM that supports transactions'
arch=('any')
url='http://search.cpan.org/dist/DBM-Deep'
license=('PerlArtistic' 'GPL')
depends=('perl')
cheackdepends=('perl-test-deep' 'perl-test-warn' 'perl-test-exception')
makedepends=('perl-module-build>=0.42')
source=(http://search.cpan.org/CPAN/authors/id/R/RK/RKINYON/DBM-Deep-2.0011.tar.gz)
options=(!emptydirs)
md5sums=('831b65e724f7590516a8c11814b97572')

build() {
	cd DBM-Deep-2.0011
	PERL_MM_USE_DEFAULT=1 perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd DBM-Deep-2.0011
	perl Build test
}

package() {
	cd DBM-Deep-2.0011
	perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
