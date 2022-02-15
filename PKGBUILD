# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: trizen .= x@gmail.com

pkgname=perl-xml-fast
pkgver=0.17
pkgrel=1
pkgdesc="Simple and very fast XML to hash conversion"
arch=('x86_64')
url="https://metacpan.org/dist/XML-Fast"
license=('GPL' 'PerlArtistic')
depends=('perl')
checkdepends=('perl-test-nowarnings')
source=("https://www.cpan.org/modules/by-module/XML/XML-Fast-${pkgver}.tar.gz")
sha512sums=('2319ba25263dd8942a6239d0e094e1375871f1d7ce5e5cb3f5734d0e4fd69d7dec240cdb903f8bbe2fab373ae5801dbfee5def0d66216988a1685d29853fa2ae')

build() {
  cd "${srcdir}/XML-Fast-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/XML-Fast-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/XML-Fast-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
