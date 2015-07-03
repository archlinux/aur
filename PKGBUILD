# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-b-flags
_lastauthor=R/RU/RURBAN
_pkgname=B-Flags
pkgver=0.13
pkgrel=1
pkgdesc="Friendlier flags for B"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('cffbb657db1682f77bdc4ed6a3e79a755b4ecf78e1e32b0bf3436265ed07fe8c49b68cca15d70dacb2f999b3aed32c2acccf525b819f234316b850ce44e13cf7')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd ${_pkgname}-${pkgver}
  perl Makefile.PL
  make
}
check() {
  cd ${_pkgname}-${pkgver}
  make test
}
package() {
  cd ${_pkgname}-${pkgver}
  make install
}

