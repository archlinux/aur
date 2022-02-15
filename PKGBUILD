# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-list-pairwise
pkgver=1.03
pkgrel=1
pkgdesc="Provides functions to map and grep lists two elements at a time"
arch=('any')
url="https://metacpan.org/dist/List-Pairwise"
license=('GPL' 'PerlArtistic')
depends=('perl')
makedepends=('perl-module-install')
source=("https://www.cpan.org/modules/by-module/List/List-Pairwise-${pkgver}.tar.gz")
sha512sums=('ed90eac006dcedd3c6c21dfed9b8fb43bd353dcfa27f92b7251b4cf4255b65409eb51cd0561c5ada6efffc9f94ba53e382c52463a21aace72b4d237e00363b61')

build() {
  cd "${srcdir}/List-Pairwise-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/List-Pairwise-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/List-Pairwise-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
