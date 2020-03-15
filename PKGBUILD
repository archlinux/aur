# CPAN Name  : WWW::Shorten
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-www-shorten
pkgver=3.093
pkgrel=2
pkgdesc='Interface to URL shortening sites'
arch=('any')
url='https://metacpan.org/release/WWW-Shorten'
license=('PerlArtistic' 'GPL')
depends=('perl-libwww' 'perl-try-tiny')
optdepends=('perl-config-auto: for configuration file support')
source=(http://search.cpan.org/CPAN/authors/id/C/CA/CAPOEIRAB/WWW-Shorten-3.093.tar.gz)
options=(!emptydirs)
md5sums=('44bfbdd42ed459bf1e87291202ed35cf')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd WWW-Shorten-3.093
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd WWW-Shorten-3.093
	sanitize
	make test
}

package() {
	cd WWW-Shorten-3.093
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
