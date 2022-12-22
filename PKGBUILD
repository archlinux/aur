# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-xs-parse-keyword
pkgver=0.30
pkgrel=1
pkgdesc="XS functions to assist in parsing keyword syntax"
arch=('x86_64')
url="https://metacpan.org/dist/XS-Parse-Keyword"
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('perl-module-build' 'perl-extutils-cchecker')
checkdepends=('perl-test-pod')
source=("https://www.cpan.org/authors/id/P/PE/PEVANS/XS-Parse-Keyword-${pkgver}.tar.gz")
sha512sums=('932e86ac3da9685ebf90a98e2d0909b32fdf994a6b84ff64cf3bbfd83572990b5193385fc22f1f4e1267b18a61ac768894f6aac1aea4f7510d98e1d332bed171')

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
