# CPAN Name  : TOML::Parser
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-toml-parser
pkgver=0.05
pkgrel=1
pkgdesc='Perl package providing TOML parser'
arch=('any')
url='https://metacpan.org/release/TOML-Parser'
license=('PerlArtistic' 'GPL')
makedepends=('perl-module-build-tiny')
depends=('perl-types-serialiser')
source=(http://search.cpan.org/CPAN/authors/id/K/KA/KARUPA/TOML-Parser-0.05.tar.gz)
options=(!emptydirs)
md5sums=('8b2cf4ec34597a6ee3a875ffb8e54678')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd TOML-Parser-0.05
	sanitize
	/usr/bin/perl Build.PL --installdirs vendor --destdir "$pkgdir"
	/usr/bin/perl Build
}

check() {
	cd TOML-Parser-0.05
	sanitize
	/usr/bin/perl Build test
}

package() {
	cd TOML-Parser-0.05
	sanitize
	/usr/bin/perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
