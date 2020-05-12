# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-moox-struct
pkgver=0.020
pkgrel=1
pkgdesc="Make simple lightweight record-like structures that make sounds like cows"
arch=('any')
url="https://github.com/tobyink/p5-moox-struct"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-b-hooks-endofscope' 'perl-exporter-tiny' 'perl-moo'
         'perl-object-id' 'perl-type-tiny' 'perl-namespace-autoclean')
source=("https://www.cpan.org/modules/by-module/MooX/MooX-Struct-${pkgver}.tar.gz")
sha512sums=('a9a14efee9db43b39df02b452aed7f558360812c28581cc245ed8eea68fc328b40fee6a9c8949851048ee6fff3ec9aa99beb5ab63845f9bcb83d9c9d1c7e712e')

build() {
  cd "${srcdir}/MooX-Struct-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/MooX-Struct-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/MooX-Struct-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
