# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Justin Davis <jrcd83@gmail.com>

_perlmod=Audio-FLAC-Header
_modnamespace=Audio
pkgname=perl-audio-flac-header
makedepends=('perl-module-install')
pkgver=2.4
pkgrel=9
pkgdesc="Audio::FLAC::Header - Access to FLAC audio metadata"
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('53728279b79d3c320c63b66dff1e3e4d8bb4fd4bde164ad775a52d8b54b3d77861daa2d4e93d8e2c2ff2f1708ece8c4d2256d96b810266760bb837e557e3b8a9')

build() {
	cd "${_perlmod}-${pkgver}"

	# Install module in vendor directories.
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "${_perlmod}-${pkgver}"
	make test
}

package() {
	cd "${_perlmod}-${pkgver}"
	make install DESTDIR="${pkgdir}/"
}
