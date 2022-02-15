# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-tie-datauuid
pkgver=1.02
pkgrel=1
pkgdesc="Tie interface to Data::UUID"
arch=('any')
url="https://github.com/2shortplanks/tie-datauuid"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-data-uuid')
makedepends=('perl-module-install')
source=("https://www.cpan.org/modules/by-module/Tie/Tie-DataUUID-${pkgver}.tar.gz")
sha512sums=('72a0b021e08258ed0f134d81ad409084a621eaa1376d4c0a0c7c625de9b3a6d87b291e64a5a1e75606f103a28ddbea0a77d593791415e994890f09131870a28c')

build() {
  cd "${srcdir}/Tie-DataUUID-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Tie-DataUUID-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Tie-DataUUID-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
