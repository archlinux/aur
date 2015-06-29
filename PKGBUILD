# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=perl-geo-distance
pkgver=0.20
pkgrel=3
pkgdesc='Geo::Distance - Perl interface to calculate geo distance from latitude and longitude'
arch=('i686' 'x86_64')
url="http://search.cpan.org/~bluefeet/Geo-Distance-${pkgver}/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/B/BL/BLUEFEET/Geo-Distance-${pkgver}.tar.gz")
sha256sums=('514c5b16ea064fa6f3f41d83672477a6dc3b9c31494d9e1b4f084ef750f9c58a')

build() {
	cd "${srcdir}/Geo-Distance-${pkgver}"

	# install module in vendor directories.
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

package() {
	cd "${srcdir}/Geo-Distance-${pkgver}"

	make install DESTDIR="${pkgdir}/"

	# remove perllocal.pod and .packlist
	find "${pkgdir}" -name perllocal.pod -delete
	find "${pkgdir}" -name .packlist -delete
}

