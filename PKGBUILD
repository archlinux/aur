# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-moosex-oneargnew
pkgver=0.007
pkgrel=1
pkgdesc="Teach ->new to accept single, non-hashref arguments"
arch=('any')
url="https://metacpan.org/release/MooseX-OneArgNew"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-moose' 'perl-moosex-role-parameterized' 'perl-namespace-autoclean')
source=("https://www.cpan.org/modules/by-module/MooseX/MooseX-OneArgNew-${pkgver}.tar.gz")
sha512sums=('4a637fe674e80527ea13b461a9a35eabbb4054bad6acbbdfe7e1cdbaeb0f861edcf0939e3971fa2d865a84ad8087f2f6795658679b547abf4669bc07fb582d91')

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
