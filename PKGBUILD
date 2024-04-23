# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-regexp-pattern-license
pkgver=3.11.1
pkgrel=1
pkgdesc="Regular expressions for legal licenses"
arch=('any')
url="https://salsa.debian.org/build-common-team/regexp-pattern-license"
license=('GPL-3.0-or-later')
depends=('perl')
checkdepends=('perl-regexp-pattern' 'perl-re-engine-re2' 'perl-test2-suite'
              'perl-test-regexp-pattern' 'perl-test-without-module'
              'perl-try-tiny')
optdepends=('perl-re-engine-re2')
source=("https://www.cpan.org/modules/by-module/Regexp/Regexp-Pattern-License-v${pkgver}.tar.gz")
sha512sums=('11c30b9673e4d009ecb871d70345e38ce692b1c53e8614d35f8ce4e7b7edfea65c8f18880929138fc1fab6ce1dee3633bb23c06ca456c5dd81928b093c57609d')

build() {
  cd "${srcdir}/Regexp-Pattern-License-v${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Regexp-Pattern-License-v${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Regexp-Pattern-License-v${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
