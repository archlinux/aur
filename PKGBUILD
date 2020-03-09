# CPAN Name  : DBM::Deep
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-dbm-deep
pkgver=2.0016
pkgrel=1
pkgdesc='A pure Perl multi-level hash/array DBM that supports transactions'
arch=('any')
url='https://metacpan.org/release/DBM-Deep'
license=('PerlArtistic' 'GPL')
depends=('perl')
checkdepends=('perl-test-deep' 'perl-test-warn' 'perl-test-exception')
makedepends=('perl-module-build>=0.42')
source=(http://search.cpan.org/CPAN/authors/id/S/SP/SPROUT/DBM-Deep-2.0016.tar.gz)
options=(!emptydirs)
md5sums=('cb8817ddd1fecc81ae2d47f812fd1f0e')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd DBM-Deep-2.0016
	sanitize
	perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd DBM-Deep-2.0016
	sanitize
	perl Build test
}

package() {
	cd DBM-Deep-2.0016
	sanitize
	perl Build install
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
