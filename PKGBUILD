# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-net-smtps
pkgver=0.10
pkgrel=1
pkgdesc="SSL/STARTTLS support for Net::SMTP"
arch=('any')
url="https://metacpan.org/release/Net-SMTPS"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-authen-sasl' 'perl-io-socket-ssl')
source=("https://www.cpan.org/modules/by-module/Net/Net-SMTPS-${pkgver}.tar.gz")
sha512sums=('e9d2202f63c5149ea72d8b37e27a5c0a7d0259de6a2afd7dad4b59ce00121cedb212d73c1f50d2b6ac77a0e0934bdc750fed3be4865c5f84b805befbdab802c4')

build() {
  cd "${srcdir}/Net-SMTPS-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Net-SMTPS-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Net-SMTPS-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
