# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-net-davtalk
pkgver=0.22
pkgrel=1
pkgdesc="Interface to talk to DAV servers"
arch=('any')
url="https://metacpan.org/dist/Net-DAVTalk"
license=('Artistic2.0')
depends=('perl' 'perl-datetime-format-iso8601' 'perl-json' 'perl-json-xs'
         'perl-tie-datauuid' 'perl-uri' 'perl-xml-fast' 'perl-xml-spice')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
source=("https://www.cpan.org/modules/by-module/Net/Net-DAVTalk-${pkgver}.tar.gz")
sha512sums=('c861d7459d6bd2653ea3afd0b4cad08f7c4c46a78dfef2b2ccd43ad2e3398281ceb67c94cfb369c9315bca16360137c89591f0569d0e21b88bea4d12536627c5')

build() {
  cd "${srcdir}/Net-DAVTalk-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Net-DAVTalk-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Net-DAVTalk-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
