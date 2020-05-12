# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-regexp-pattern-license
pkgver=3.3.0
pkgrel=1
pkgdesc="Regular expressions for legal licenses"
arch=('any')
url="https://salsa.debian.org/build-common-team/regexp-pattern-license"
license=('GPL3')
depends=('perl' 'perl-re-engine-re2' 'perl-strictures')
checkdepends=('perl-regexp-pattern' 'perl-test-exception'
              'perl-test-regexp-pattern' 'perl-test-requires' 'perl-try-tiny')
source=("https://www.cpan.org/modules/by-module/Regexp/Regexp-Pattern-License-v${pkgver}.tar.gz")
sha512sums=('70c482b6bb59ed8a09a61bf5681637b57562b540bbb53e57dc8bc1aedefceb068d9053fcb41cac6a391d6796b0194ed4fc651e8fbba4eaf45f4df3048e1e0b18')

build() {
  cd "${srcdir}/Regexp-Pattern-License-v${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Regexp-Pattern-License-v${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Regexp-Pattern-License-v${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
