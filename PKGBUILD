# CPAN Name  : Test::Identity
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-test-identity
pkgver=0.01
pkgrel=2
pkgdesc='Perl module to test the referential identity of a reference'
arch=('any')
url='https://metacpan.org/release/Test-Identity'
license=('PerlArtistic' 'GPL')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Test-Identity-0.01.tar.gz)
options=(!emptydirs)
md5sums=('ecef85c791cf5847e4c374983cf22a74')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
}

build() {
	cd Test-Identity-0.01
	sanitize
	perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd Test-Identity-0.01
	sanitize
	perl Build test
}

package() {
	cd Test-Identity-0.01
	sanitize
	perl Build install
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
