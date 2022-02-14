# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-class-inner
pkgver=0.200001
pkgrel=1
pkgdesc="A perlish implementation of Java like inner classes"
arch=('any')
url="https://metacpan.org/dist/Class-Inner"
license=('GPL' 'PerlArtistic')
depends=('perl')
source=("https://www.cpan.org/modules/by-module/Class/Class-Inner-${pkgver}.tar.gz")
sha512sums=('308d688577ac9eeea14bd665269d4f32f5f9c4be9ac47460c0d4be4248c3eaabb9eb51e9a840a5e8dab58e35cf10c831b55321fdc5a2c83e04eec88ba2b8f905')

build() {
  cd "${srcdir}/Class-Inner-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Class-Inner-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Class-Inner-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
