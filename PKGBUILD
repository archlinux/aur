# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-string-errf
pkgver=0.009
pkgrel=1
pkgdesc="A simple sprintf-like dialect"
arch=('any')
url="https://metacpan.org/dist/String-Errf"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-params-util' 'perl-string-formatter' 'perl-sub-exporter')
checkdepends=('perl-timedate' 'perl-json-maybexs')
source=("https://www.cpan.org/modules/by-module/String/String-Errf-${pkgver}.tar.gz")
sha512sums=('2089e1240e896e1e573a38911965171103b085b99aeacb06e92b59846017c133bee0db71cc39c963e3d63a1e939b5503941fb4efbf83b856d87a0e3a332ba571')

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
