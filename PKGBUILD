# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-test-regexp-pattern
pkgver=0.006
pkgrel=1
pkgdesc="Test Regexp::Pattern patterns"
arch=('any')
url="https://github.com/perlancar/perl-Test-Regexp-Pattern"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-hash-defhash' 'perl-regexp-pattern')
source=("https://www.cpan.org/modules/by-module/Test/Test-Regexp-Pattern-${pkgver}.tar.gz")
sha512sums=('e45e363d63f30bd7255e41873fa9f96755a832d3ee89640f00b39ce4b14606b27be7adfec04d29b1ca949c23bf1000ea89c8743e573985a778e0e81bbcb89e51')

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
