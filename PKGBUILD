# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-tk-tframe
pkgver=2.08
pkgrel=1
pkgdesc='Perl/CPAN Module Tk::TFrame'
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/Tk-TFrame'
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/S/SR/SREZIC/Tk-GBARR-$pkgver.tar.gz")
depends=('perl')
md5sums=('8791dc6ddba154ccb9b6a54e8ad11351')

build() {
	cd "$srcdir/Tk-GBARR-$pkgver"

	# install module in vendor directories
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
	make install DESTDIR="$pkgdir/"

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
