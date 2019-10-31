# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=perl-json-webtoken
pkgver=0.10
pkgrel=3
pkgdesc="Perl/CPAN module JSON WebToken"
arch=('any')
url="http://search.cpan.org/~xaicron/JSON-WebToken/"
license=('GPL')
depends=('perl-json')
makedepends=('perl-module-build' 'perl-module-runtime' 'perl-test-mock-guard'
             'perl-test-requires')
source=("http://search.cpan.org/CPAN/authors/id/X/XA/XAICRON/JSON-WebToken-${pkgver}.tar.gz")
sha512sums=('ce4acd42814db12fc16c60a8937a4e7d420b0243c3ca26f96a36ee2a2fb4a14f93538340b199fcce9cfbb090d60de5d7e24d5f008a84e1365d7c31f6db9ee312')

build() {
  cd JSON-WebToken-${pkgver}
  perl Build.PL
  ./Build
}

check() {
  cd JSON-WebToken-${pkgver}
  ./Build test
}

package(){
  cd JSON-WebToken-${pkgver}
  ./Build install --destdir "${pkgdir}"
}
