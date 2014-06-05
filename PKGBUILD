# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-tk-gbarr
pkgver=2.08
pkgrel=4
pkgdesc='Perl/CPAN Module Tk::TFrame,Cloth,NumEntry,NumEntryPlain,FireButton'
arch=('any')
url='http://metacpan.org/release/Tk-GBARR'
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/S/SR/SREZIC/Tk-GBARR-$pkgver.tar.gz")
provides=('perl-tk-tframe')
conflicts=('perl-tk-tframe')
depends=()
md5sums=('8791dc6ddba154ccb9b6a54e8ad11351')

build() {
	cd "$srcdir/Tk-GBARR-$pkgver"

	# install module in vendor directories
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}
package() {
	cd "$srcdir/Tk-GBARR-$pkgver"
	make install DESTDIR="$pkgdir/"

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
