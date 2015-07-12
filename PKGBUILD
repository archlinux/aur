# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Francois Charette <firmicus@gmx.net>

_perlmod='Font-TTF'
_modnamespace='Font'
pkgname='perl-font-ttf'
pkgver='1.05'
pkgrel='1'
pkgdesc='Font::TTF - Perl module for TrueType Font hacking'
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('Artistic2.0')
depends=('perl-io-string')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha256sums=('26c48e4e76e00f0ac00766b3cfba79f0cb8cbf005b7a39033f0e8e0d9eeafb50')

build() {
	cd "${_perlmod}-${pkgver}"

	# Install module in vendor directories.
	PERL_MM_USE_DEFAULT=1 perl 'Makefile.PL' INSTALLDIRS='vendor'
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
