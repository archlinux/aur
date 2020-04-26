# Maintainer: Frederik Schwan <freswa at archlinux dot org>

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
b2sums=('823f09e7d0c2d325de19c0d0f1204d1d0573407978c6d86119e052264c16d8c81a49ee74a9551bcbbe8f054916cd02236e4fb8f0c26ee5e539b71e1a30cdceb6')

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
