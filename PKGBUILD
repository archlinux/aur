# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-config-mvp
pkgver=2.200013
pkgrel=1
pkgdesc="Multivalue-property package-oriented configuration"
arch=('any')
url="https://metacpan.org/dist/Config-MVP"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-class-load' 'perl-module-pluggable' 'perl-moose'
         'perl-moosex-oneargnew' 'perl-params-util' 'perl-role-hasmessage'
         'perl-role-identifiable' 'perl-throwable' 'perl-tie-ixhash'
         'perl-try-tiny')
checkdepends=('perl-test-fatal')
source=("https://www.cpan.org/modules/by-module/Config/Config-MVP-${pkgver}.tar.gz")
sha512sums=('aae4431a559f62332f5d7072d799ad5eaea9baf978a4145228dbfd80617e0131b9a80d2033a65da735a01abb4f40ce599b306e721dd4b3e98d6a56d984b21fd7')

build() {
  cd "${srcdir}/Config-MVP-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Config-MVP-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Config-MVP-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
