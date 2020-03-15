# CPAN Name  : Unicode::CaseFold
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-unicode-casefold
pkgver=1.01
pkgrel=2
pkgdesc='Perl package for Unicode case-folding for case-insensitive lookups'
arch=('i686' 'x86_64')
url='https://metacpan.org/release/Unicode-CaseFold'
license=('PerlArtistic' 'GPL')
makedepends=('perl-module-build')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/A/AR/ARODLAND/Unicode-CaseFold-1.01.tar.gz)
options=(!emptydirs)
md5sums=('b4c670725cb011b13a64a32a4bc8ec79')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Unicode-CaseFold-1.01
	/usr/bin/perl Build.PL --installdirs vendor --destdir "$pkgdir"
	/usr/bin/perl Build
}

check() {
	cd Unicode-CaseFold-1.01
	/usr/bin/perl Build test
}

package() {
	cd Unicode-CaseFold-1.01
	/usr/bin/perl Build install
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
