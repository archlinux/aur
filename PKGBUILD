# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

_perlmod=Regexp-Common
_modnamespace=Regexp
pkgname=perl-regexp-common
pkgver=2013031301
pkgrel=4
pkgdesc="Regexp::Common - Provides commonly requested regular expressions"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/${_perlmod}"
license=('MIT')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha256sums=('729a8198d264aa64ecbb233ff990507f97fbb66bda746b95f3286f50f5f25c84')

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
	make install DESTDIR="${pkgdir}"
}
