# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-xml-spice
pkgver=0.05
pkgrel=1
pkgdesc="Yet another XML generation module"
arch=('any')
url="https://github.com/robn/XML-Spice"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-xml-tidy-tiny')
checkdepends=('perl-test-xml')
source=("https://www.cpan.org/modules/by-module/XML/XML-Spice-${pkgver}.tar.gz")
sha512sums=('c08bc5379f1a74144efc399539cd4910a395bd92fb5f21b913cc12c9e456c80f12201333fe1ba3a7d60745c5f07222dfbc82e50de1d42bea813c5665dae6a0ea')

build() {
  cd "${srcdir}/XML-Spice-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/XML-Spice-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/XML-Spice-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
