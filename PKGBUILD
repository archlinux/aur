# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-string-copyright
pkgver=0.003011
pkgrel=1
pkgdesc="Representation of text-based copyright statements"
arch=('any')
url="https://salsa.debian.org/build-common-team/string-copyright"
license=('AGPL3')
depends=('perl' 'perl-exporter-tiny' 'perl-number-range')
checkdepends=('perl-test2-suite' 'perl-test-without-module')
source=("https://www.cpan.org/modules/by-module/String/String-Copyright-${pkgver}.tar.gz")
sha512sums=('dc7a4a15e8f2c6d47ffd2e61003717eb7fc3c8c7f299f8dc02242573b7a3025fbd4fe306e14e255ea0aa66a64a7fd2564b8373d488c9f45a203012161c91c1bc')

build() {
  cd "${srcdir}/String-Copyright-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/String-Copyright-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/String-Copyright-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
