# Mainter: knedl1k <knedl1k at duck dot com>
# Contributor: Olivire Mehani <shtrom-arch@ssji.net>
# Generator  : CPANPLUS::Dist::Arch 1.06

pkgname=perl-crypt-x509
pkgver=0.55
pkgrel=1
pkgdesc="Pure Perl X.509 Parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-convert-asn1>=0.19')
url='http://search.cpan.org/dist/Crypt-X509'
source=("https://cpan.metacpan.org/authors/id/M/MR/MRSCOTTY/Crypt-X509-$pkgver.tar.gz")
PERL=/usr/bin/perl

prepare() {
	DIST_DIR="${srcdir}/Crypt-X509-$pkgver"
	export PERL_MM_USE_DEFAULT=1 PERL5LIB=""			\
		PERL_AUTOINSTALL=--skipdeps				\
		PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"	\
		PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'"	\
		MODULEBUILDRC=/dev/null
	cd "$DIST_DIR"
	$PERL Makefile.PL
}

build() {
	DIST_DIR="${srcdir}/Crypt-X509-$pkgver"
	cd "$DIST_DIR"
	make
}

test() {
	DIST_DIR="${srcdir}/Crypt-X509-$pkgver"
	cd "$DIST_DIR"
	make test
}

package() {
	DIST_DIR="${srcdir}/Crypt-X509-$pkgver"
	cd "$DIST_DIR"
	make install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

md5sums=('011c3cdfdbf93bde6a46396cc6252df7')
