# CPAN Name  : Test::Deep::Fuzzy
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-test-deep-fuzzy
pkgver=0.01
pkgrel=1
pkgdesc='Perl package for fuzzy number comparison with Test::Deep'
arch=('any')
url='https://metacpan.org/release/Test-Deep-Fuzzy'
license=('PerlArtistic' 'GPL')
depends=('perl-test-deep' 'perl-math-round')
makedepends=('perl-module-build-tiny')
source=(http://search.cpan.org/CPAN/authors/id/K/KA/KARUPA/Test-Deep-Fuzzy-0.01.tar.gz)
options=(!emptydirs)
md5sums=('e50e492322e0c62a191aa096bd23ad25')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Test-Deep-Fuzzy-0.01
	sanitize
	/usr/bin/perl Build.PL --installdirs vendor --destdir "$pkgdir"
	/usr/bin/perl Build
}

check() {
	cd Test-Deep-Fuzzy-0.01
	sanitize
	/usr/bin/perl Build test
}

package() {
	cd Test-Deep-Fuzzy-0.01
	sanitize
	/usr/bin/perl Build install
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
