# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-regexp-pattern-license
pkgver=3.9.3
pkgrel=1
pkgdesc="Regular expressions for legal licenses"
arch=('any')
url="https://salsa.debian.org/build-common-team/regexp-pattern-license"
license=('GPL3')
depends=('perl')
checkdepends=('perl-regexp-pattern' 'perl-test2-suite'
              'perl-test-regexp-pattern' 'perl-test-without-module'
              'perl-try-tiny')
optdepends=('perl-re-engine-re2')
source=("https://www.cpan.org/modules/by-module/Regexp/Regexp-Pattern-License-v${pkgver}.tar.gz")
sha512sums=('0f5363ad26de6dbe8214aec8a284315940938fa8aa842edd72178c71b65658bff13f3b4f112f4c875e38425ccc8d6450771c8bbe8195359900589d1107c39525')

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
