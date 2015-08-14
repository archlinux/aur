# CPAN Name  : HTTP::Headers::Fast
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-http-headers-fast
pkgver=0.18
pkgrel=1
pkgdesc='A faster implementation of HTTP::Headers'
arch=('any')
url='https://metacpan.org/release/HTTP-Headers-Fast'
license=('PerlArtistic' 'GPL')
makedepends=('perl-module-build>=0.38')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/T/TO/TOKUHIROM/HTTP-Headers-Fast-0.18.tar.gz)
options=(!emptydirs)
md5sums=('af5819f7e93861e8f1f1467e6d541291')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd HTTP-Headers-Fast-0.18
	sanitize
	perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd HTTP-Headers-Fast-0.18
	sanitize
	perl Build test
}

package() {
	cd HTTP-Headers-Fast-0.18
	sanitize
	perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
