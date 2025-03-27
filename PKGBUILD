# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname=perl-io-interactive
pkgver=1.026
pkgrel=1
pkgdesc="Utilities for interactive I/O"
arch=('any')
url="https://metacpan.org/dist/IO-Interactive"
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=('perl')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
source=("https://www.cpan.org/modules/by-module/IO/IO-Interactive-${pkgver}.tar.gz")
sha512sums=('d8c0af451a1f45e2e2ec5cc8dc3fca777d59dc04a301bf83dbe4f3839038e04744d69e9cdc82f9e5f4f8c59fac1fcb81cd7134f6d080e36eb4a25bd27bfd01d3')

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
