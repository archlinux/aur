# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-xs-parse-keyword
pkgver=0.21
pkgrel=1
pkgdesc="XS functions to assist in parsing keyword syntax"
arch=('x86_64')
url="https://metacpan.org/dist/XS-Parse-Keyword"
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('perl-module-build' 'perl-extutils-cchecker')
checkdepends=('perl-test-pod')
source=("https://www.cpan.org/authors/id/P/PE/PEVANS/XS-Parse-Keyword-${pkgver}.tar.gz")
sha512sums=('f42688985b4afa386f9a27f312846c107f3123cbb026a18889cbca67714a30250fab7d408181be557bb362b6b2e1c6f5aba3c41d5d96f8dbf1ca7e31856af9a5')

build() {
  cd "${srcdir}/XS-Parse-Keyword-${pkgver}"

  perl Build.PL create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/XS-Parse-Keyword-${pkgver}"

  ./Build test
}

package() {
  cd "${srcdir}/XS-Parse-Keyword-${pkgver}"

  ./Build install --installdirs=vendor --destdir="${pkgdir}"
}
