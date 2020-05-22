# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-regexp-pattern-license
pkgver=3.4.0
pkgrel=1
pkgdesc="Regular expressions for legal licenses"
arch=('any')
url="https://salsa.debian.org/build-common-team/regexp-pattern-license"
license=('GPL3')
depends=('perl' 'perl-re-engine-re2' 'perl-strictures')
checkdepends=('perl-regexp-pattern' 'perl-test-exception'
              'perl-test-regexp-pattern' 'perl-test-requires' 'perl-try-tiny')
source=("https://www.cpan.org/modules/by-module/Regexp/Regexp-Pattern-License-v${pkgver}.tar.gz")
sha512sums=('5524535f8eebe6cc2ce2065bae1f726b9a2717c34262df2ddd9106464dcfbaeb67eb310679bb636e728669f17041e4f101c7fb241a8e07a6cf3dc6fb3ae88e12')

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
