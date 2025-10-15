# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-regexp-pattern-license
pkgver=3.11.2
pkgrel=2
pkgdesc="Regular expressions for legal licenses"
arch=('any')
url="https://salsa.debian.org/build-common-team/regexp-pattern-license"
license=('GPL-3.0-or-later')
depends=('perl')
checkdepends=('perl-regexp-pattern' 'perl-re-engine-re2'
              'perl-test-regexp-pattern' 'perl-test-without-module'
              'perl-try-tiny')
optdepends=('perl-re-engine-re2')
source=("https://www.cpan.org/modules/by-module/Regexp/Regexp-Pattern-License-v${pkgver}.tar.gz")
sha512sums=('15275dac71efbcee4fe011d11d4353e95b6e2045f31ca7162c8fe78de733a4242f3d7b950b5d345b4fae0ae2c3cdff2a5a4c029f37f0a6402bffff897d452a6d')

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
