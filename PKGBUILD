# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-moosex-oneargnew
pkgver=0.006
pkgrel=1
pkgdesc="Teach ->new to accept single, non-hashref arguments"
arch=('any')
url="https://metacpan.org/release/MooseX-OneArgNew"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-moose' 'perl-moosex-role-parameterized' 'perl-namespace-autoclean')
source=("https://www.cpan.org/modules/by-module/MooseX/MooseX-OneArgNew-${pkgver}.tar.gz")
sha512sums=('77395725d79182b050939b9f9d7cf36a349ce619758dfc02f12d9690ccb53d46fd6bbb6c6cf255b5f186512a94071f0c6f6d4152f0864979c82fa4e13cc45428')

build() {
  cd "${srcdir}/MooseX-OneArgNew-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/MooseX-OneArgNew-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/MooseX-OneArgNew-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
