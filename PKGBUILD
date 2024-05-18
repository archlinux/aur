# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname=perl-io-interactive
pkgver=1.025
pkgrel=1
pkgdesc="Utilities for interactive I/O"
arch=('any')
url="https://metacpan.org/dist/IO-Interactive"
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=('perl')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
source=("https://www.cpan.org/modules/by-module/IO/IO-Interactive-${pkgver}.tar.gz")
sha512sums=('b9aca9d3920ea256e5b2c3e19559e7626ab076b36b38b58eecf087d8a2614b805a0226246bf035eb41b801a0972dfb19e1c99d2f8105bd403db5017e84b6e2dc')

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
