# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-regexp-pattern
pkgver=0.2.14
pkgrel=1
pkgdesc="Convention/framework for modules that contain collection of regexes"
arch=('any')
url="https://github.com/perlancar/perl-Regexp-Pattern"
license=('GPL' 'PerlArtistic')
depends=('perl')
checkdepends=('perl-test-exception')
source=("https://www.cpan.org/modules/by-module/Regexp/Regexp-Pattern-${pkgver}.tar.gz")
sha512sums=('85386d757982eb374a85c8c12d16a1ad24384b741ed1bd63292d2d3504ff0ec613fa49627a7e7d4d0f53f8e594bd613dd0c5b9da5b3237ad54c0a099ece60b0e')

build() {
  cd "${srcdir}/Regexp-Pattern-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Regexp-Pattern-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Regexp-Pattern-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
