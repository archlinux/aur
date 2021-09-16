# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-test-regexp-pattern
pkgver=0.009
pkgrel=1
pkgdesc="Test Regexp::Pattern patterns"
arch=('any')
url="https://github.com/perlancar/perl-Test-Regexp-Pattern"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-hash-defhash' 'perl-regexp-pattern')
source=("https://www.cpan.org/modules/by-module/Test/Test-Regexp-Pattern-${pkgver}.tar.gz")
sha512sums=('7a25c84f32117c036de33d2cc943dc3adca972d576b11bbd4d3e1afbb86b9fef098eb50dd90487ea392807ef52ed256be41fb3d6a773aab6ef1c249455c9a859')

build() {
  cd "${srcdir}/Test-Regexp-Pattern-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Test-Regexp-Pattern-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Test-Regexp-Pattern-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
