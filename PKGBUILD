# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-xs-parse-sublike
pkgver=0.16
pkgrel=1
pkgdesc="XS functions to assist in parsing C<sub>-like syntax"
arch=('x86_64')
url="https://metacpan.org/dist/XS-Parse-Sublike"
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('perl-module-build')
checkdepends=('perl-test-fatal' 'perl-test-pod')
source=("https://www.cpan.org/authors/id/P/PE/PEVANS/XS-Parse-Sublike-${pkgver}.tar.gz")
sha512sums=('66615f291b498e132fc3513a18ae7723ad19e7daa5ff1e455d467235d7078d9d546281af38f5aa55a757b1cc8835fbf1e52944f0e580e7f135a574d625ef6613')

build() {
  cd "${srcdir}/XS-Parse-Sublike-${pkgver}"

  perl Build.PL create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/XS-Parse-Sublike-${pkgver}"

  ./Build test
}

package() {
  cd "${srcdir}/XS-Parse-Sublike-${pkgver}"

  ./Build install --installdirs=vendor --destdir="${pkgdir}"
}
