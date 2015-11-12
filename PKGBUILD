# CPAN Name  : HTTP::Headers::Fast
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-http-headers-fast
pkgver=0.19
pkgrel=1
pkgdesc='A faster implementation of HTTP::Headers'
arch=('any')
url='https://metacpan.org/release/HTTP-Headers-Fast'
license=('PerlArtistic' 'GPL')
makedepends=('perl-module-build>=0.38')
depends=('perl')
checkdepends=('perl-test-requires')
source=(http://search.cpan.org/CPAN/authors/id/T/TO/TOKUHIROM/HTTP-Headers-Fast-0.19.tar.gz)
options=(!emptydirs)
md5sums=('c9493ff2fe0e1b9009d9add281a94be4')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd HTTP-Headers-Fast-0.19
	sanitize
	perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd HTTP-Headers-Fast-0.19
	sanitize
	perl Build test
}

package() {
	cd HTTP-Headers-Fast-0.19
	sanitize
	perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
