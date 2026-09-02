# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-regexp-pattern-license
pkgver=3.11.3
pkgrel=1
pkgdesc="Regular expressions for legal licenses"
arch=('any')
url="https://salsa.debian.org/build-common-team/regexp-pattern-license"
license=('GPL-3.0-or-later')
depends=('perl')
checkdepends=('perl-regexp-pattern' 'perl-re-engine-re2'
              'perl-test-regexp-pattern' 'perl-test-without-module'
              'perl-try-tiny')
optdepends=('perl-re-engine-re2')
source=("https://www.cpan.org/modules/by-module/Regexp/JONASS/Regexp-Pattern-License-v${pkgver}.tar.gz")
sha512sums=('07a7a329a1934e740e2ef599234f5c79d2e7e6b9fbb01e43b13fca7b211a5b98acb9aa8a1add8c137cac9bbf8f1f77d1b4ec6b6681f036a156f1d6c6da5a828f')

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
