# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-string-copyright
pkgver=0.003014
pkgrel=2
pkgdesc="Representation of text-based copyright statements"
arch=('any')
url="https://salsa.debian.org/build-common-team/string-copyright"
license=('AGPL-3.0-or-later')
depends=('perl' 'perl-exporter-tiny' 'perl-set-intspan')
checkdepends=('perl-test-without-module')
optdepends=('perl-re-engine-re2')
source=("https://www.cpan.org/modules/by-module/String/String-Copyright-${pkgver}.tar.gz")
sha512sums=('39874b267fcd01e6ffbcdae15af74918fddcb586c2f0708ba30b47957a4e6613689776b9e80a649689374a913b2c6c285ed58823620b6553cd56d6d99e632f08')

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
