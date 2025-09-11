# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=perl-net-mqtt-simple
pkgver=1.33
pkgrel=1
pkgdesc="Net::MQTT::Simple - Very simple MQTT implementation"
arch=(any)
license=('unknown')
url="https://search.cpan.org/dist/Net-MQTT-Simple/"
depends=('perl')
options=(!emptydirs)
source=(https://search.cpan.org/CPAN/authors/id/J/JU/JUERD/Net-MQTT-Simple-${pkgver}.tar.gz)
sha256sums=('58539c1c2794d25872652d78a26c9fd26b627bdad1b9134a159869c1b2822aa7')

build() {
  cd "$srcdir"/Net-MQTT-Simple-${pkgver}
  yes n | perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir"/Net-MQTT-Simple-${pkgver}
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
