# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-test-regexp-pattern
pkgver=0.010
pkgrel=1
pkgdesc="Test Regexp::Pattern patterns"
arch=('any')
url="https://github.com/perlancar/perl-Test-Regexp-Pattern"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-hash-defhash' 'perl-regexp-pattern')
source=("https://www.cpan.org/modules/by-module/Test/Test-Regexp-Pattern-${pkgver}.tar.gz")
sha512sums=('058e35d960b3cf31d1cd37da71825ced74d2d466245afdeba70dffa5e83eef1e0ed4e79b0e58752eaee7063b0aac349010a7913e688de8d11823a445cbcf4a22')

build() {
  cd "${srcdir}/Test-Regexp-Pattern-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Test-Regexp-Pattern-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Test-Regexp-Pattern-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
