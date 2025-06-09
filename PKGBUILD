# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname=perl-io-interactive
pkgver=1.027
pkgrel=1
pkgdesc="Utilities for interactive I/O"
arch=('any')
url="https://metacpan.org/dist/IO-Interactive"
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=('perl')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
source=("https://www.cpan.org/modules/by-module/IO/IO-Interactive-${pkgver}.tar.gz")
sha512sums=('a3d23a9e54d4c75edc93e182db87184dedc1e50357a388ed0e3d93961576e437160fdbb194c3e5c86f74ba321948192c254e33ad469af06e0c90eeaa56ca7e9f')

build() {
  cd "${srcdir}/IO-Interactive-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/IO-Interactive-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/IO-Interactive-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
