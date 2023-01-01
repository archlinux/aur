# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-sub-exporter-formethods
pkgver=0.100055
pkgrel=1
pkgdesc="Helper routines for using Sub::Exporter to build methods"
arch=('any')
url="https://metacpan.org/dist/Sub-Exporter-ForMethods"
license=('PerlArtistic' 'GPL')
depends=('perl-sub-exporter')
checkdepends=('perl-namespace-autoclean')
source=("https://www.cpan.org/modules/by-module/Sub/Sub-Exporter-ForMethods-${pkgver}.tar.gz")
sha512sums=('d4e2a02d7628f5d51b3d17937ba3f14ae4efead8e1ca298ae7c901e15177fa2e6df4367543303f21307137d857e232190a8b2c286ff6fe64fbae11e26172868d')

build() {
  cd "${srcdir}/Sub-Exporter-ForMethods-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Sub-Exporter-ForMethods-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Sub-Exporter-ForMethods-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
