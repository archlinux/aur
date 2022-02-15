# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-mail-jmaptalk
pkgver=0.15
pkgrel=1
pkgdesc="Basic interface to talk to JMAP Servers"
arch=('any')
url="https://metacpan.org/dist/Mail-JMAPTalk"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-convert-base64' 'perl-file-libmagic' 'perl-json')
source=("https://www.cpan.org/modules/by-module/Mail/Mail-JMAPTalk-${pkgver}.tar.gz")
sha512sums=('a92f14e3676717d12cc1879582a1f35ccd05401c57bef6fb3c4aaf345ef76db2eca1dee0656eadfc322400719b2de9a7969a60e87ad8286b8dba64b9119faab7')

build() {
  cd "${srcdir}/Mail-JMAPTalk-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Mail-JMAPTalk-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Mail-JMAPTalk-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
