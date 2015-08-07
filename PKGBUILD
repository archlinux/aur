# CPAN Name  : DBM::Deep
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-dbm-deep
pkgver=2.0012
pkgrel=1
pkgdesc='A pure Perl multi-level hash/array DBM that supports transactions'
arch=('any')
url='https://metacpan.org/release/DBM-Deep'
license=('PerlArtistic' 'GPL')
depends=('perl')
cheackdepends=('perl-test-deep' 'perl-test-warn' 'perl-test-exception')
makedepends=('perl-module-build>=0.42')
source=(http://search.cpan.org/CPAN/authors/id/R/RK/RKINYON/DBM-Deep-2.0012.tar.gz)
options=(!emptydirs)
md5sums=('da911dada2c978ea6bd4d1bac4b4ba46')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd DBM-Deep-2.0012
	sanitize
	perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd DBM-Deep-2.0012
	sanitize
	perl Build test
}

package() {
	cd DBM-Deep-2.0012
	sanitize
	perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
