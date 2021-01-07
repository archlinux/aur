# CPAN Name  : HTTP::Entity::Parser
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-http-entity-parser
pkgver=0.25
pkgrel=1
pkgdesc='PSGI compliant HTTP Entity Parser'
arch=('any')
url='https://metacpan.org/release/HTTP-Entity-Parser'
license=('PerlArtistic' 'GPL')

depends=('perl-http-multipartparser' 'perl-hash-multivalue'
	'perl-json-maybexs>=1.003007' 'perl-stream-buffered'
	'perl-www-form-urlencoded>=0.23')
makedepends=('perl-module-build-tiny>=0.035')
checkdepends=('perl-http-message>=6.00')
source=(http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/HTTP-Entity-Parser-0.25.tar.gz)
options=(!emptydirs)
md5sums=('09663f9577975587e832e28ba5f5f8af')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd HTTP-Entity-Parser-0.25
	sanitize
	/usr/bin/perl Build.PL --installdirs vendor --destdir "$pkgdir"
	/usr/bin/perl Build
}

check() {
	cd HTTP-Entity-Parser-0.25
	sanitize
	/usr/bin/perl Build test
}

package() {
	cd HTTP-Entity-Parser-0.25
	sanitize
	/usr/bin/perl Build install
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
