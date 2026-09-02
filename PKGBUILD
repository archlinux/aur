# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-string-copyright
pkgver=0.4.1
pkgrel=1
epoch=1
pkgdesc="Representation of text-based copyright statements"
arch=('any')
url="https://salsa.debian.org/build-common-team/string-copyright"
license=('AGPL-3.0-or-later')
depends=('perl' 'perl-exporter-tiny' 'perl-log-any')
checkdepends=('perl-test-without-module')
optdepends=('perl-re-engine-re2')
source=("https://www.cpan.org/modules/by-module/String/JONASS/String-Copyright-v${pkgver}.tar.gz")
sha512sums=('f8e050eb838d87f4417743db25d78dd441d61fae34febd7d1f4f5614e3148d0367e08e0ad20d8a244419f54a88205283ed911b8638793b071ccc53b2eee5f372')

build() {
  cd "${srcdir}/String-Copyright-v${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/String-Copyright-v${pkgver}"

  make test
}

package() {
  cd "${srcdir}/String-Copyright-v${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
