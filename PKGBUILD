# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>

_perlmod=Set-IntSpan
_modnamespace=Set
pkgname=perl-set-intspan
pkgver=1.19
pkgrel=5
pkgdesc="Perl Set::IntSpan - Manages sets of integers, .newsrc style"
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('PerlArtistic')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('de743bc26e4e9daf0bff636279219776421a31d1b3fa5d8e9232e051f2396cbfdd339dacd4aadc006cf31527935550c8659d8c80cbaed5942895239ab36c9cd9')

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
