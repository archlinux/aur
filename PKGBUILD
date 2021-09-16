# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-string-errf
pkgver=0.008
pkgrel=1
pkgdesc="A simple sprintf-like dialect"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-params-util' 'perl-string-formatter')
checkdepends=('perl-timedate' 'perl-json-maybexs')
url="https://metacpan.org/release/String-Errf"
source=("https://www.cpan.org/modules/by-module/String/String-Errf-${pkgver}.tar.gz")
sha512sums=('0684613c932ace4b7ee2f44a73a1bfd90ce195203ffb3da8ec5689d7ed912854490288d8e559cd97ff7af5b8c0486abdb357353c1dee4edbdc4b17ada56b156b')

build() {
  cd "${srcdir}/String-Errf-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/String-Errf-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/String-Errf-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
