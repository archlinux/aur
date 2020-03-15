# CPAN Name  : Text::Lorem
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-text-lorem
pkgver=0.3
pkgrel=2
pkgdesc='Perl package and tool to generate random Latin looking text'
arch=('any')
url='https://metacpan.org/release/Text-Lorem'
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('perl-module-build')
source=(http://search.cpan.org/CPAN/authors/id/A/AD/ADEOLA/Text-Lorem-0.3.tar.gz)
options=(!emptydirs)
md5sums=('7fa832ff29a5307bcd80dd4af8ec3e7d')

build() {
	cd Text-Lorem-0.3
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT
	PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd Text-Lorem-0.3
	perl Build test
}

package() {
	cd Text-Lorem-0.3
	perl Build install
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
