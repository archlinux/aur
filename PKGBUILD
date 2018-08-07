# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-net-smtps
pkgver=0.09
pkgrel=1
pkgdesc="SSL/STARTTLS support for Net::SMTP"
arch=('any')
url="https://metacpan.org/release/Net-SMTPS"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-authen-sasl' 'perl-io-socket-ssl')
source=("https://www.cpan.org/modules/by-module/Net/Net-SMTPS-${pkgver}.tar.gz")
sha512sums=('856d7068fe3c41c48048dae564db5d526521753f58ac4ec9b973360991853c3a7b7ea3d3e25b17692601765be522fc5bf1456a0b645325e724a482ec559d5e5f')

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
