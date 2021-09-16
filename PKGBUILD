# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-regexp-pattern-defhash
pkgver=0.001
pkgrel=1
pkgdesc="Regexp patterns related to DefHash"
arch=('any')
url="https://github.com/perlancar/perl-Regexp-Pattern-DefHash"
license=('GPL' 'PerlArtistic')
depends=('perl')
source=("https://www.cpan.org/modules/by-module/Regexp/Regexp-Pattern-DefHash-${pkgver}.tar.gz")
sha512sums=('d1dc846b1c44cfc2c0d7b1e23ac8ba2b9958f2827d777890f429758570f6418eb003a9b708b733a74acea568cf08a66388800f1a950eb5b579dc3dbcad7b5593')

build() {
  cd "${srcdir}/Regexp-Pattern-DefHash-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Regexp-Pattern-DefHash-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Regexp-Pattern-DefHash-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
