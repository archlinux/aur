# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=perl-net-mqtt-simple
pkgver=1.32
pkgrel=1
pkgdesc="Net::MQTT::Simple - Very simple MQTT implementation"
arch=(any)
license=('unknown')
url="https://search.cpan.org/dist/Net-MQTT-Simple/"
depends=('perl')
options=(!emptydirs)
source=(https://search.cpan.org/CPAN/authors/id/J/JU/JUERD/Net-MQTT-Simple-${pkgver}.tar.gz)
sha256sums=('e6d91945b43fe472171bec2fb0f737ee3f55770fc478068bee0f6a990faf8d7d')

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
