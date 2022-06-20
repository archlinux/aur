# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-xs-parse-keyword
pkgver=0.23
pkgrel=1
pkgdesc="XS functions to assist in parsing keyword syntax"
arch=('x86_64')
url="https://metacpan.org/dist/XS-Parse-Keyword"
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('perl-module-build' 'perl-extutils-cchecker')
checkdepends=('perl-test-pod')
source=("https://www.cpan.org/authors/id/P/PE/PEVANS/XS-Parse-Keyword-${pkgver}.tar.gz")
sha512sums=('58edd9990a9b187bb94a6b33cd30ee16961a8140b6c2c836ba8f7883d04f9bf5fe350b471a88c8f7facd4eadcd072f6440d075dfd8736e55cd8b37caf2182557')

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
