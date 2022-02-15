# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-class-xsaccessor
pkgver=1.19
pkgrel=3
pkgdesc="Generate fast XS accessors without runtime compilation"
arch=('x86_64')
url="https://metacpan.org/dist/Class-XSAccessor"
license=('PerlArtistic' 'GPL')
depends=('perl')
source=("https://www.cpan.org/modules/by-module/Class/Class-XSAccessor-${pkgver}.tar.gz")
sha512sums=('58855bb2108b60cc90ae1d1c4d6a011da7bac2d063c7c953ff8610ae164ba60731a664f0fbddf148e1eabb60042913a17633a9c9a8936a23a59130b381bf63f8')
_distdir="Class-XSAccessor-1.19"

build() {
  cd "${srcdir}/Class-XSAccessor-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Class-XSAccessor-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Class-XSAccessor-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
