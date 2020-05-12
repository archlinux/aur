# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-string-copyright
pkgver=0.003006
pkgrel=1
pkgdesc="Representation of text-based copyright statements"
arch=('any')
url="https://salsa.debian.org/build-common-team/string-copyright"
license=('GPL3')
depends=('perl' 'perl-exporter-tiny' 'perl-number-range')
source=("https://www.cpan.org/modules/by-module/String/String-Copyright-${pkgver}.tar.gz")
sha512sums=('7852d96cbe465dde14b4c093f77374b530967412ef95a98703fe838511e405ea9744e4dbfa314bc5a33fc23b160d8a4866654ad60da1bfb07853263f1c11cd3f')

build() {
  cd "${srcdir}/String-Copyright-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/String-Copyright-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/String-Copyright-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
