# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-geo-coordinates-vandh
pkgver=1.11
pkgrel=3
pkgdesc='Perl/CPAN Module Geo::Coordinates::VandH'
arch=('any')
url='http://search.cpan.org/dist/Geo-Coordinates-VandH'
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/P/PT/PTIMMINS/Geo-Coordinates-VandH-$pkgver.tar.gz")
depends=()
md5sums=('65a0d6fedb0c04a6560128945f76918e')

build() {
	cd "$srcdir/Geo-Coordinates-VandH-$pkgver"

	# install module in vendor directories
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}
package() {
	cd "$srcdir/Geo-Coordinates-VandH-$pkgver"
	make install DESTDIR="$pkgdir/"

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
