# CPAN Name  : WWW::Shorten
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-www-shorten
pkgver=3.06
pkgrel=1
pkgdesc='Interface to URL shortening sites'
arch=('any')
url='https://metacpan.org/release/WWW-Shorten'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-libwww')
optdepends=('perl-config-auto: for configuration file support')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAVECROSS/WWW-Shorten-3.06.tar.gz)
options=(!emptydirs)
md5sums=('7fec4441d031973710ee61999f964bd2')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd WWW-Shorten-3.06
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd WWW-Shorten-3.06
	sanitize
	make test
}

package() {
	cd WWW-Shorten-3.06
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
