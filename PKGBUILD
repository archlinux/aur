# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-net-davtalk
pkgver=0.20
pkgrel=1
pkgdesc="Interface to talk to DAV servers"
arch=('any')
url="https://metacpan.org/dist/Net-DAVTalk"
license=('Artistic2.0')
depends=('perl' 'perl-datetime-format-iso8601' 'perl-json' 'perl-json-xs'
         'perl-tie-datauuid' 'perl-uri' 'perl-xml-fast' 'perl-xml-spice')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
source=("https://www.cpan.org/modules/by-module/Net/Net-DAVTalk-${pkgver}.tar.gz")
sha512sums=('3a894e96d8ee039ef870489c403ea1f8848eaed9f5c8f607571967b4d67a1492bbb1468f1a92797ba49105611b4aa95bc1db514cd652a444e5f319dd20fd23f7')

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
