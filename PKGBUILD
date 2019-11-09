# CPAN Name  : HTTP::Headers::Fast
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-http-headers-fast
pkgver=0.22
pkgrel=1
pkgdesc='A faster implementation of HTTP::Headers'
arch=('any')
url='https://metacpan.org/release/HTTP-Headers-Fast'
license=('PerlArtistic' 'GPL')
makedepends=('perl-module-build-tiny>=0.035')
depends=('perl-http-date')
checkdepends=('perl-test-requires')
source=(http://search.cpan.org/CPAN/authors/id/T/TO/TOKUHIROM/HTTP-Headers-Fast-0.22.tar.gz)
options=(!emptydirs)
md5sums=('a166a4d0ba47eca8ff9dffb760865f5f')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd HTTP-Headers-Fast-0.22
	sanitize
	perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd HTTP-Headers-Fast-0.22
	sanitize
	perl Build test
}

package() {
	cd HTTP-Headers-Fast-0.22
	sanitize
	perl Build install
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
