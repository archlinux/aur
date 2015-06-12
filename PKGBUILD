# Contributor: Kevin Piche <kevin@archlinux.org>
# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=perl-net-arp
_realname=Net-ARP
pkgver=1.0.8
pkgrel=2
pkgdesc="Perl Module: Extension for creating ARP Packets" 
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
source=(http://cpan.metacpan.org/authors/id/C/CR/CRAZYDJ/${_realname}-${pkgver}.tgz)
sha1sums=('be5e6123d50446a43bb4e8f90c4e45049c96634f')

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd ${srcdir}/${_realname}-${pkgver}
  make install DESTDIR=${pkgdir}

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
# vim: ts=2 sw=2 et ft=sh
