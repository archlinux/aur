# CPAN Name  : IO::Handle::Util
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-io-handle-util
pkgver=0.02
pkgrel=1
pkgdesc='Perl module with functions for working with IO::Handle like objects'
arch=('any')
url='https://metacpan.org/release/IO-Handle-Util'
license=('PerlArtistic' 'GPL')
makedepends=('perl-module-build-tiny>=0.034')
depends=('perl-asa' 'perl-io-string' 'perl-sub-exporter')
source=(http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/IO-Handle-Util-0.02.tar.gz)
options=(!emptydirs)
md5sums=('a334bd3fc284d176e0aaccb1b65b4279')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd IO-Handle-Util-0.02
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd IO-Handle-Util-0.02
	sanitize
	make test
}

package() {
	cd IO-Handle-Util-0.02
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
